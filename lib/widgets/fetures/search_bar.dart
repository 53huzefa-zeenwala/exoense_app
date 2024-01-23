// import 'package:flutter/material.dart';
//
// class SearchBarWithIcon extends StatefulWidget {
//   final void Function() onSubmit;
//   final void Function(String val) onChange;
//   final void Function() onClear;
//   final String label;
//   final double? width;
//   final InputBorder? border;
//   final bool showIcon;
//
//   const SearchBarWithIcon(
//       {super.key,
//       required this.onSubmit,
//       required this.onChange,
//       required this.onClear,
//       required this.label,
//       this.width,
//       this.border,
//       this.showIcon = true});
//
//   @override
//   State<SearchBarWithIcon> createState() => _SearchBarWithIconState();
// }
//
// class _SearchBarWithIconState extends State<SearchBarWithIcon> {
//   TextEditingController _controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     final border = widget.border ??
//         OutlineInputBorder(
//             borderRadius: widget.showIcon ? BorderRadius.horizontal(left: Radius.circular(6)) : BorderRadius.circular(6),
//             borderSide: BorderSide(color: blueAccentColor));
//     return Row(
//       children: [
//         SizedBox(
//           width: widget.width ?? 200,
//           child: TextFormField(
//             controller: _controller,
//             textCapitalization: TextCapitalization.characters,
//             style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, fontFamily: fontFamilyName),
//             decoration: InputDecoration(
//               labelText: widget.label,
//               floatingLabelBehavior: FloatingLabelBehavior.never,
//               labelStyle: TextStyle(fontWeight: FontWeight.w500, fontFamily: fontFamilyName, fontSize: 14, color: Colors.grey),
//               suffixIcon: _controller.text.isNotEmpty
//                   ? InkWell(
//                       onTap: () {
//                         _controller.clear();
//                         widget.onClear();
//                         Focus.of(context).unfocus();
//                       },
//                       child: Icon(Icons.clear),
//                     )
//                   : null,
//               enabledBorder: border,
//               focusedBorder: border,
//             ).applyDefaults(inputDecorationTheme),
//             keyboardType: TextInputType.text,
//             onFieldSubmitted: (val) {
//               widget.onSubmit();
//             },
//             onChanged: widget.onChange,
//           ),
//         ),
//         Visibility(
//           visible: widget.showIcon,
//           child: Material(
//             color: blueAccentColor,
//             borderRadius: BorderRadius.horizontal(
//               right: Radius.circular(6),
//             ),
//             child: InkWell(
//               onTap: widget.onSubmit,
//               child: Container(
//                 height: 40,
//                 width: 40,
//                 child: const Icon(
//                   Icons.search,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
