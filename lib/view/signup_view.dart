import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../res/colors.dart';
import '../res/components/round_button.dart';
import '../utils/routes/route_names.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _obscurePasswordConfirm = ValueNotifier<bool>(true);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _passConfirmController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passFocusNode = FocusNode();
  final FocusNode _passConfirmFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passController.dispose();
    _passConfirmController.dispose();

    _emailFocusNode.dispose();
    _passFocusNode.dispose();
    _passConfirmFocusNode.dispose();

    _obscurePassword.dispose();
    _obscurePasswordConfirm.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final authViewModelProvider = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("S I G N U P"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              focusNode: _emailFocusNode,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: "Email",
                  labelText: "Email"
              ),
              onFieldSubmitted: (value) => Utils.changeFocus(context, _emailFocusNode, _passFocusNode),
            ),
            const SizedBox(height: 20,),
            ValueListenableBuilder(valueListenable: _obscurePassword, builder:
                (context, value, child) {
              return  TextFormField(
                controller: _passController,
                focusNode: _passFocusNode,
                obscureText: _obscurePassword.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon:  InkWell(
                      onTap: () {
                        _obscurePassword.value = !_obscurePassword.value;
                      },
                      child: _obscurePassword.value ? const Icon(Icons.visibility_rounded) : const Icon(Icons.visibility_off)
                  ),
                  hintText: "Password",
                  labelText: "Password",
                ),

              );
            }),
            const SizedBox(height: 20,),
            ValueListenableBuilder(valueListenable: _obscurePasswordConfirm, builder:
                (context, value, child) {
              return  TextFormField(
                controller: _passConfirmController,
                focusNode: _passConfirmFocusNode,
                obscureText: _obscurePasswordConfirm.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon:  InkWell(
                      onTap: () {
                        _obscurePasswordConfirm.value = !_obscurePasswordConfirm.value;
                      },
                      child: _obscurePasswordConfirm.value ? const Icon(Icons.visibility_rounded) : const Icon(Icons.visibility_off)
                  ),
                  hintText: "Confirm Password",
                  labelText: "Confirm Password",
                ),

              );
            }),

            const SizedBox(height: 50,),
            RoundButton(
                title: "Signup",
                loading: authViewModelProvider.getLoadingSignup,
                onPress: () {
                  if(_emailController.text.isEmpty){
                    Utils.createFlushBar(context, "Enter Email");
                  }
                  else if(_passController.text.isEmpty){
                    Utils.createFlushBar(context, "Enter Password");
                  }
                  else if(_passController.text.length < 6){
                    Utils.createFlushBar(context, "Password length too short");
                  }else if(_passController.text != _passConfirmController.text){
                    Utils.createFlushBar(context, "Confirm Password not matched");
                  }
                  else {

                    Map data = {
                      'email': _emailController.text.toString(),
                      'password': _passController.text.toString(),
                    };

                    authViewModelProvider.signupApi(context, data);


                  }

                }),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an Account?",
                  style: TextStyle(
                  ),
                ),
                const SizedBox(width: 6),
                GestureDetector(
                  onTap: () => Navigator.pushReplacementNamed(context, RouteNames.login),
                  child: const Text("Login In",
                    style: TextStyle(
                        color: MyColors.appThemeColor,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
