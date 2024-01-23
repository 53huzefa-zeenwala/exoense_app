import 'package:expense_app/utils/build_context_ext.dart';
import 'package:flutter/material.dart';

class CustomField extends StatefulWidget {
  final String titleText;
  final String? hintText;
  final String? defaultValue;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final void Function(String? val)? onChange;
  final void Function(String? val)? onSaved;
  final bool isClear;
  final String? Function(String?)? validator;
  final bool autoFocus;
  final bool isPassword;
  final IconData? suffixIcon;

  const CustomField({
    super.key,
    required this.titleText,
    this.autoFocus = false,
    this.hintText,
    this.defaultValue,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.onChange,
    this.onSaved,
    this.isClear = true,
    this.validator,
    this.isPassword = false,
    this.suffixIcon,
  });

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  late final TextEditingController _controller;
  bool _obscureText = false;

  @override
  void initState() {
    _obscureText = widget.isPassword;
    _controller = widget.controller ??
        TextEditingController(
          text: widget.defaultValue,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.titleText,
          style: context.textTheme.labelMedium?.apply(color: Colors.grey.shade700).copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 4,
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
            controller: _controller,
            onSaved: widget.onSaved,
            onChanged: widget.onChange,
            keyboardType: widget.keyboardType,
            validator: widget.validator,
            obscureText: _obscureText,
            autofocus: widget.autoFocus,
            enableSuggestions: true,
            style: context.textTheme.titleMedium,
            textDirection: TextDirection.ltr,
            decoration: InputDecoration(
              filled: false,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: context.colorScheme.primary,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Colors.grey.shade700,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: context.colorScheme.error,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: context.colorScheme.error,
                ),
              ),
              prefixIcon: widget.isPassword
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                    )
                  : null,
              prefix: widget.isClear
                  ? InkWell(
                      onTap: () {
                        _controller.clear();
                        widget.onChange?.call('');
                      },
                      child: SizedBox(
                        height: 55,
                        child: Text(
                          "Clear",
                          style: context.textTheme.labelSmall?.apply(color: context.colorScheme.primary).copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  : null,
              suffixIcon: widget.suffixIcon != null ? Icon(widget.suffixIcon) : null,
              hintText: widget.hintText,
              hintTextDirection: TextDirection.ltr,
              alignLabelWithHint: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              suffixIconColor: context.colorScheme.primary,
              // constraints: BoxConstraints(maxHeight: 55),
              helperText: '',
              hintStyle: context.textTheme.titleMedium?.apply(color: Colors.grey),
              helperStyle: TextStyle(height: 0.05),
              errorStyle: TextStyle(
                height: 0.05,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
