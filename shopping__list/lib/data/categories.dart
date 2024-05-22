import 'package:flutter/material.dart';
import 'package:shopping__list/models/category.dart';

const categories = {
  Categories.vegetables: Category(
    Categories.vegetables,
    Color.fromARGB(255, 0, 255, 128),
  ),
  Categories.fruit: Category(
    Categories.fruit,
    Color.fromARGB(255, 145, 255, 0),
  ),
  Categories.meat: Category(
    Categories.meat,
    Color.fromARGB(255, 255, 102, 0),
  ),
  Categories.dairy: Category(
    Categories.dairy,
    Color.fromARGB(255, 23, 103, 122),
  ),
  Categories.carbs: Category(
    Categories.carbs,
    Color.fromARGB(255, 0, 60, 255),
  ),
  Categories.sweets: Category(
    Categories.sweets,
    Color.fromARGB(255, 255, 149, 0),
  ),
  Categories.spices: Category(
    Categories.spices,
    Color.fromARGB(255, 255, 187, 0),
  ),
  Categories.convenience: Category(
    Categories.convenience,
    Color.fromARGB(255, 191, 0, 255),
  ),
  Categories.hygiene: Category(
    Categories.hygiene,
    Color.fromARGB(255, 149, 0, 255),
  ),
  Categories.other: Category(
    Categories.other,
    Color.fromARGB(255, 0, 225, 255),
  ),
};
