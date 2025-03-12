import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constant/colors.dart';
import 'package:sizer/sizer.dart';
import '../constant/image_pathes.dart';
import '../widgets/Social_login.dart';
import '../widgets/build_label_text.dart';
import '../widgets/custom_button.dart';
import '../widgets/remember.dart';
import '../widgets/text_field_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  @override
  void dispose() {
    _fullNameController.dispose();
    _usernameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _emailError;
  String? _passwordError;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 3.h),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20.w),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: BorderColor,
                            width: 2,
                          ),
                        ),
                        child: Center(
                            child: IconButton(
                          icon: Icon(
                            Icons.arrow_left_outlined,
                            size: 5.h,
                          ),
                          onPressed: () {},
                        )),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: Center(
                    child: Image.asset(
                      ImagePathes.logo,
                      width: 200,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),

            //Your Name
            BuildLabelText(
              sizePaddding: 30,
              text: "Your Name",
            ),
            TextFieldWidget(
              mailPassText: 'Full Name',
              icon: Icons.edit,
              controller: _fullNameController,
            ),
            SizedBox(
              height: 1.h,
            ),

            //Username
            BuildLabelText(
              sizePaddding: 30,
              text: "Username",
            ),
            TextFieldWidget(
              mailPassText: 'Username',
              icon: Icons.person,
              controller: _usernameController,
            ),
            SizedBox(
              height: 1.h,
            ),

            //Phone Number
            BuildLabelText(
              sizePaddding: 26,
              text: "Phone Number",
            ),
            TextFieldWidget(
              mailPassText: 'Phone Number',
              icon: Icons.phone,
              controller: _phoneController,
              
            ),
            SizedBox(
              height: 1.h,
            ),

            //Email
            BuildLabelText(
              sizePaddding: 33,
              text: "Email",
            ),
            TextFieldWidget(
              mailPassText: 'You@gmail.com',
              icon: Icons.mail_outline,
              controller: _emailController,
              errorText: _emailError,
            ),
            SizedBox(
              height: 1.h,
            ),

            //Password
            BuildLabelText(
              sizePaddding: 30,
              text: "Password",
            ),
            TextFieldWidget(
              mailPassText: 'Password',
              icon: Icons.lock_outlined,
              controller: _passwordController,
              errorText: _passwordError,
            ),
            SizedBox(
              height: 1.h,
            ),

            //Confirm Password
            BuildLabelText(
              sizePaddding: 23,
              text: "Confirm Password",
            ),
            TextFieldWidget(
              mailPassText: 'Confirm Password',
              icon: Icons.lock_outlined,
              controller: _confirmPasswordController,
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomButton(
              textcolor: Colors.white,
              groundColor: PrimaryColor,
              button: "Sign Up",
              onPressed: () {},
            ),
            SizedBox(
              height: 1.h,
            ),
            SocialLoginButtons(),
            SizedBox(height: 3.h),
          ],
        ),
      ),
    );
  }
}
