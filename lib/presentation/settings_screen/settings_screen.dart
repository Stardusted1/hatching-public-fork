import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatching/core/blocs/auth_cubit/auth_cubit.dart';
import 'package:hatching/utils/resourses.dart';

const _imageHeight = 75.0;

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        children: [
          _buildAccount(context),
          _buildLogoutButton(context),
          _buildAppLanguage(context),
        ],
      );

  ListTile _buildAppLanguage(BuildContext context) {
    return ListTile(
      title: Text('app_language'.tr()),
      trailing: DropdownButton<Locale>(
        underline: Container(),
        borderRadius: BorderRadius.circular(15),
        isDense: true,
        items: EasyLocalization.of(context)!.supportedLocales.map((e) {
          return DropdownMenuItem(
            child: Text(e.languageCode),
            value: e,
          );
        }).toList(),
        onChanged: (value) async =>
            await EasyLocalization.of(context)?.setLocale(value!),
        value: EasyLocalization.of(context)?.locale,
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return ListTile(
      title: Text("logout".tr()),
      trailing: IconButton(
        icon: const Icon(Icons.logout),
        onPressed: () async => context.read<AuthCubit>().logout(),
      ),
    );
  }

  Widget _buildAccount(BuildContext context) {
    final user = context.read<AuthCubit>().authUser;
    return Column(
      children: [
        const SizedBox(height: AppConstants.appMargin),
        SizedBox(
          height: _imageHeight,
          width: _imageHeight,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              context.read<AuthCubit>().authUser?.photoURL ?? "",
            ),
          ),
        ),
        const SizedBox(height: AppConstants.halfAppMargin),
        Wrap(
          spacing: AppConstants.halfAppMargin,
          children: [
            Chip(label: Text(user?.email ?? "")),
            Chip(
              label: Text(
                "${"auth_provider".tr()}: ${user?.providerData.first.providerId ?? ""}",
              ),
            )
          ],
        ),
      ],
    );
  }
}
