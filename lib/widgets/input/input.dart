import 'package:flutter/material.dart';
import 'package:ion_mobile/design/colors.dart';

class IonTextInput extends StatefulWidget {
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function()? action;
  final bool hasObscureText;
  final bool fixLabel;
  final String? msgError;
  final String? placeHolder;
  
  

  const IonTextInput({
    super.key,
    this.labelText, 
    this.prefixIcon, 
    this.suffixIcon, 
    this.action, 
    this.hasObscureText = false, 
    this.fixLabel = false,
    this.msgError,
    this.placeHolder});


  @override
  _IonTextInputState createState() => _IonTextInputState();
}

class _IonTextInputState extends State<IonTextInput> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        floatingLabelBehavior: widget.fixLabel? FloatingLabelBehavior.always: FloatingLabelBehavior.auto,
        hintText: widget.placeHolder,
        hintStyle: const TextStyle(color: IonMainColors.neutral6 ),
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: IonMainColors.primary6),
        errorText: widget.msgError,
        errorBorder: widget.msgError!=null?OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: IonIndicativeColors.negative6, width: 3, ),
        ):null,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: IonMainColors.primary6, width: 3),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left:12.0),
          child: widget.prefixIcon,
        ), 
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right:12.0),
          child: widget.suffixIcon!=null?
         IconButton(
          icon: widget.hasObscureText?
           Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ):
          widget.suffixIcon!,
          //
          onPressed: widget.hasObscureText? _togglePasswordVisibility : widget.action??(){},
        ):const SizedBox.shrink())
      ),
    );
  }
}
