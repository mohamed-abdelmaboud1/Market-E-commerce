import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi_ecommers/core/widgets/core/custom_text__widget.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/routing/app_router.dart';
import '../../../../core/widgets/bar_widget.dart';
import '../../../cart/presentation/view/widgets/elevated_button_widget.dart';
import '../../data/models/check_out_model.dart';
import '../view_model/checkout_cubit/checkout_cubit.dart';
import '../view_model/checkout_cubit/checkout_state.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.checkoutData});
  final dynamic checkoutData;
  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: BlocConsumer<CheckoutCubit, CheckoutState>(
        listener: (context, state) {
          if (state is CheckoutLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Order placed successfully ✅")),
            );
            context.push(AppRouter.successOrderPage);
          } else if (state is CheckoutError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errMessage)),
            );
          }
        },
        builder: (context, state) {
          if (state is CheckoutLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BarWidget(textBar: "Checkout"),
                  const SizedBox(height: 20),

                  /// Address Section
                  _sectionTitle("Address"),
                  const SizedBox(height: 8),
                  _addressCard(),

                  const SizedBox(height: 20),

                  /// Delivery time
                  _sectionTitle("Delivery time"),
                  const SizedBox(height: 8),
                  _infoCard(
                    icon: Icons.local_shipping_outlined,
                    text: "Within 2 days",
                  ),

                  const SizedBox(height: 20),

                  /// Payment Method
                  _sectionTitle("Payment"),
                  const SizedBox(height: 8),
                  _infoCard(
                    icon: Icons.payments_outlined,
                    text: "Cash on delivery",
                    trailing: TextButton(
                      onPressed: () {},
                      child: const Text("Change"),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// Voucher
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Voucher code",
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text("Apply"),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// Payment Summary
                  _sectionTitle("Payment"),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        _buildRow("Subtotal (3 items)", "EGP 1,120.00"),
                        const Divider(),
                        _buildRow("Delivery Fees", "EGP 10.00"),
                        const Divider(thickness: 1.5),
                        _buildRow("Total", "EGP 1,130.00",
                            isBold: true, color: Colors.blue),
                      ],
                    ),
                  ),

                  SizedBox(height: 7.h),

                  /// Place Order Button
                  ElevatedButtonWidget(
                    textButton: "Place Order",
                    onPressed: () {
                      context.read<CheckoutCubit>().checkoutAll(
                            widget.checkoutData.products,
                          );

                      print(
                        widget.checkoutData.userId,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return CustomTextWidget(
      color: Colors.black,
      fontSize: 16,
      text: text,
      fontWeight: FontWeight.bold,
    );
  }

  Widget _addressCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.home, color: Colors.blue),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Home", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Anshas, Al-sharqia, Egypt."),
                Text("Mobile: +20 101 840 3043"),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("Change"),
          ),
        ],
      ),
    );
  }

  Widget _infoCard(
      {required IconData icon, required String text, Widget? trailing}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.black54),
          const SizedBox(width: 8),
          Text(text),
          const Spacer(),
          if (trailing != null) trailing,
        ],
      ),
    );
  }
}

Widget _buildRow(String label, String value,
    {bool isBold = false, Color? color}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomTextWidget(
          color: Colors.black,
          fontSize: 17.sp,
          text: label,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
      CustomTextWidget(
        color: color ?? Colors.black,
        fontSize: 17.sp,
        text: value,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    ],
  );
}
