import 'package:flutter/material.dart';
import 'calculator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController aController = TextEditingController();
  final TextEditingController bController = TextEditingController();
  final TextEditingController cController = TextEditingController();
  final FocusNode aFocusNode = FocusNode();
  String result = "";

  static const TextStyle textStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 14,
    color: Color(0xff000000),
  );

  static const EdgeInsetsGeometry padding = EdgeInsets.symmetric(vertical: 8);
  static const BoxConstraints containerConstraints = BoxConstraints(maxWidth: 400);
  static const Color appBarColor = Color(0xff8d3ae8);
  static const Color buttonColor = Color(0xf85532b4);
  static const Color fillColor = Color(0xfff2f2f3);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(aFocusNode);
    });
  }

  void calculateRoots() {
    final double a = double.tryParse(aController.text) ?? 0;
    final double b = double.tryParse(bController.text) ?? 0;
    final double c = double.tryParse(cController.text) ?? 0;

    final resultCalculation = calculateQuadraticRoots(a, b, c);

    setState(() {
      result = resultCalculation;
    });
  }

  Widget _buildTextField(
      TextEditingController controller,
      String label,
      String hint, {
        FocusNode? focusNode,
      }) {
    return Padding(
      padding: padding,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        style: textStyle,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: textStyle,
          hintText: hint,
          hintStyle: textStyle,
          filled: true,
          fillColor: fillColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Color(0xff000000),
              width: 1,
            ),
          ),
          contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
        ),
      ),
    );
  }

  @override
  void dispose() {
    aFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 4,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: appBarColor,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        title: const Text(
          "Equação do 2º Grau",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 14,
            color: Color(0xfffefefe),
          ),
        ),
        leading: const Icon(
          Icons.account_tree_outlined,
          color: Color(0xfff9f9f9),
          size: 24,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            constraints: containerConstraints,
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Cálculo das raízes",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 24,
                    color: Color(0xff000000),
                  ),
                ),
                _buildTextField(aController, "a =", "Coeficiente de x²", focusNode: aFocusNode),
                _buildTextField(bController, "b =", "Coeficiente de x"),
                _buildTextField(cController, "c =", "Termo independente"),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: MaterialButton(
                    onPressed: calculateRoots,
                    color: buttonColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(
                        color: Color(0xff808080),
                        width: 1,
                      ),
                    ),
                    padding: EdgeInsets.all(16),
                    textColor: Colors.white,
                    height: 40,
                    minWidth: MediaQuery.of(context).size.width * 0.7,
                    child: const Text(
                      "Calcular",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: TextField(
                    controller: TextEditingController(text: result),
                    style: textStyle.copyWith(fontStyle: FontStyle.italic),
                    decoration: InputDecoration(
                      labelText: "Resultado...",
                      labelStyle: textStyle.copyWith(fontStyle: FontStyle.italic),
                      filled: true,
                      fillColor: fillColor,
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Color(0xe2000000),
                          width: 1,
                        ),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                    ),
                    readOnly: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
