import 'package:flutter/material.dart';
import 'package:movie_app/res/colors.dart';
import 'package:movie_app/res/components/round_button.dart';
import 'package:movie_app/utils/routes/route_names.dart';
import 'package:movie_app/utils/utils.dart';
import 'package:movie_app/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passController.dispose();

    _emailFocusNode.dispose();
    _passFocusNode.dispose();

    _obscurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {

    //final height = MediaQuery.of(context).size.height;
    final authViewModelProvider = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("L O G I N"),
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

            const SizedBox(height: 50,),
            RoundButton(
                title: "Login",
                loading: authViewModelProvider.getLoading,
                onPress: () {
                  if(_emailController.text.isEmpty){
                    Utils.createFlushBar(context, "Enter Email");
                  }
                  else if(_passController.text.isEmpty){
                    Utils.createFlushBar(context, "Enter Password");
                  }
                  else if(_passController.text.length < 6){
                    Utils.createFlushBar(context, "Password length too short");
                  }
                  else {

                    Map data = {
                      'email': _emailController.text.toString(),
                      'password': _passController.text.toString(),
                    };

                    authViewModelProvider.loginApi(context, data);

                  }

            }),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an Account?",
                  style: TextStyle(
                  ),
                ),
                const SizedBox(width: 6),
                GestureDetector(
                  onTap: () => Navigator.pushReplacementNamed(context, RouteNames.signup),
                  child: const Text("Register Now",
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
