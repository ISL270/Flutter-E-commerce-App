import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/Services/Users_db.dart';
import 'package:shop_app/globalVars.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../Services/authentication.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../Services/Products_db.dart';
import '../../../globalVars.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product_dbServices p = new product_dbServices();
    User user = context.read<AuthenticationService>().CurrentUser();
    final users_dbServices u = new users_dbServices(uid: user.uid);
    globalVars g = globalVars();

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                Spacer(),
                Text("Add voucher code"),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: SecondaryColorDark,
                )
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Consumer<globalVars>(builder: (_, gv, __) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Total:\n",
                      style: TextStyle(
                          color: SecondaryColorDark,
                          fontSize: 12,
                          fontFamily: 'PantonBoldItalic'),
                      children: [
                        TextSpan(
                          text: "${gv.total} EGP",
                          style: TextStyle(
                              color: PrimaryColor,
                              fontSize: 20,
                              fontFamily: 'PantonBoldItalic'),
                        ),
                      ],
                    ),
                  ),
                  Consumer<globalVars>(builder: (_, gv, __) {
                    return SizedBox(
                      width: getProportionateScreenWidth(190),
                      child: DefaultButton(
                        text: "Check Out",
                        press: () {},
                      ),
                    );
                  }),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
