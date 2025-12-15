import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../Api/Config.dart';

class ComplaintController extends GetxController {
  final getData = GetStorage();
  final isLoading = false.obs;
  final complaints = <Map<String, dynamic>>[].obs;
  final currentPage = 1.obs;
  final totalPages = 1.obs;
  final totalComplaints = 0.obs;

  // Form controllers
  final subjectController = TextEditingController();
  final descriptionController = TextEditingController();
  final selectedCategory = 'other'.obs;
  final selectedPriority = 'medium'.obs;
  final selectedOrderId = Rxn<int>();

  final categories = [
    {'value': 'order_issue', 'label': 'Order Issue'},
    {'value': 'payment', 'label': 'Payment Problem'},
    {'value': 'delivery', 'label': 'Delivery Issue'},
    {'value': 'app_bug', 'label': 'App Bug'},
    {'value': 'other', 'label': 'Other'},
  ];

  final priorities = [
    {'value': 'low', 'label': 'Low'},
    {'value': 'medium', 'label': 'Medium'},
    {'value': 'high', 'label': 'High'},
    {'value': 'urgent', 'label': 'Urgent'},
  ];

  @override
  void onInit() {
    super.onInit();
    fetchComplaints();
  }

  @override
  void onClose() {
    subjectController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  String? _getToken() {
    final loginData = getData.read("StoreLogin");
    if (loginData != null && loginData is Map) {
      return loginData['security_token'];
    }
    return null;
  }

  Future<void> fetchComplaints({int page = 1}) async {
    try {
      isLoading.value = true;
      String? token = _getToken();

      if (token == null || token.isEmpty) {
        Get.snackbar('Error', 'Please login again',
            backgroundColor: Colors.red, colorText: Colors.white);
        return;
      }

      final response = await http.post(
        Uri.parse(Config.getMyComplaintsApi),
        headers: {
          'Content-Type': 'application/json',
          'Security-Token': token,
        },
        body: jsonEncode({'page': page}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['Result'] == 'true') {
          complaints.value =
              List<Map<String, dynamic>>.from(data['Complaints'] ?? []);
          currentPage.value = data['Pagination']?['current_page'] ?? 1;
          totalPages.value = data['Pagination']?['total_pages'] ?? 1;
          totalComplaints.value = data['Pagination']?['total_complaints'] ?? 0;
        }
      }
    } catch (e) {
      print('Error fetching complaints: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> submitComplaint() async {
    if (subjectController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter a subject',
          backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    }

    if (descriptionController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please describe your issue',
          backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    }

    try {
      isLoading.value = true;
      String? token = _getToken();

      if (token == null || token.isEmpty) {
        Get.snackbar('Error', 'Please login again',
            backgroundColor: Colors.red, colorText: Colors.white);
        return false;
      }

      final body = {
        'subject': subjectController.text.trim(),
        'description': descriptionController.text.trim(),
        'category': selectedCategory.value,
        'priority': selectedPriority.value,
      };

      if (selectedOrderId.value != null) {
        body['order_id'] = selectedOrderId.value.toString();
      }

      final response = await http.post(
        Uri.parse(Config.submitComplaintApi),
        headers: {
          'Content-Type': 'application/json',
          'Security-Token': token,
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['Result'] == 'true') {
          Get.snackbar('Success', 'Complaint submitted successfully!',
              backgroundColor: Colors.green, colorText: Colors.white);
          clearForm();
          fetchComplaints();
          return true;
        } else {
          Get.snackbar('Error', data['ResponseMsg'] ?? 'Failed to submit',
              backgroundColor: Colors.red, colorText: Colors.white);
        }
      }
    } catch (e) {
      print('Error submitting complaint: $e');
      Get.snackbar('Error', 'Failed to submit complaint',
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
    return false;
  }

  void clearForm() {
    subjectController.clear();
    descriptionController.clear();
    selectedCategory.value = 'other';
    selectedPriority.value = 'medium';
    selectedOrderId.value = null;
  }

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'in_progress':
        return Colors.blue;
      case 'resolved':
        return Colors.green;
      case 'closed':
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }

  Color getPriorityColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'urgent':
        return Colors.red;
      case 'high':
        return Colors.deepOrange;
      case 'medium':
        return Colors.amber;
      case 'low':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
