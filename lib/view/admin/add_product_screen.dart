import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_food_firebase_pro/controller/product_controller.dart';
import 'package:flutter_food_firebase_pro/view/common_widget/auth_textfeild.dart';
import 'package:provider/provider.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductController>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              InkWell(
                onTap: () {
                  provider.pickImage();
                },
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: provider.selectedImage != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(
                            File(provider.selectedImage!.path),
                            fit: BoxFit.cover,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            color: Colors.grey[200],
                            child: const Icon(
                              Icons.image,
                              size: 100,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 20),
              AuthTextfeild(
                controller: provider.productNameController,
                text: 'Enter Product Name',
              ),
              AuthTextfeild(
                controller: provider.productPriceController,
                text: 'Enter Product Price',
              ),
              AuthTextfeild(
                controller: provider.productDiscriptionController,
                text: 'Enter Product Discription',
              ),
              const SizedBox(height: 20),
              DropdownButton<String>(
                value: provider.selectedValue,
                items: provider.options.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  provider.dropdownonChange(newValue);
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  provider.addProductAccordingly();
                },
                child: const Text('ADD Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
