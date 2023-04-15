import 'package:flutter/material.dart';
import 'package:flutter_google_docs/presentation/home.dart';
import 'package:flutter_google_docs/presentation/login.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoute = RouteMap(routes: {
  '/': (route) => const MaterialPage(child: LoginScreen()),
});

final loggedInRoute = RouteMap(routes: {
  '/': (route) => const MaterialPage(child: HomeScreen()),
});
