// ignore_for_file: prefer_final_fields

import 'dart:developer';
// ignore: prefer_const_literals_to_create_immutables
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// ignore_for_file: prefer_const_constructors
import '../components/event_card.dart';
import '../models/event.dart';
import 'package:new_project/r_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  dynamic _money = 0;
  dynamic _damage = 30;
  dynamic _bossImage = "";
  dynamic numberboss = 1;
  dynamic _boss_reward = 10;
  dynamic _bossHp = 550;
  dynamic _maxBossKilled = 0;
  damage(TapDownDetails details) {
    setState(() {
      _bossHp = _bossHp - _damage;
      if (_bossHp <= 0) {
        _money += bosses[numberboss - 1].reward;
        _bossHp = bosses[numberboss - 1].hp;
        if (_maxBossKilled <= numberboss) {
          _maxBossKilled = numberboss;
        }
      }
      // print("boss hp = $_bossHp");
    });
  }

  final List<Boss> bosses = [
    Boss(name: 'Sword1', hp: 550, img: "assets/images/boss_1.jpg", reward: 10),
    Boss(name: 'Sword2', hp: 850, img: "assets/images/boss_2.jpg", reward: 30),
    Boss(name: 'Sword3', hp: 1440, img: "assets/images/boss_3.jpg", reward: 50),
    Boss(name: 'Sword4', hp: 1740, img: "assets/images/boss_4.jpg", reward: 70),
    Boss(name: 'Sword5', hp: 3040, img: "assets/images/boss_5.jpg", reward: 90),
    Boss(name: 'Sword6', hp: 5240, img: "assets/images/boss_6.jpg", reward: 110),
    Boss(name: 'Sword7', hp: 8540, img: "assets/images/boss_7.jpg", reward: 120)
  ];
  bool _isEnable = true;
  final List<Swords> events = [
    Swords(name: 'Карась', price: 40, damage: 10, enable: 1),
    Swords(name: 'Sword2', price: 150, damage: 30, enable: 1),
    Swords(name: 'Sword3', price: 440, damage: 50, enable: 1),
    Swords(name: 'Sword4', price: 740, damage: 70, enable: 1),
    Swords(name: 'Sword5', price: 1040, damage: 90, enable: 1),
    Swords(name: 'Sword6', price: 1240, damage: 100, enable: 1),
    Swords(name: 'Sword7', price: 1540, damage: 120, enable: 1)
  ];
  void buy_sword(index) {
    setState(() {
      if (_money >= events[index].price) {
        if (events[index].enable == 1) {
          _damage += events[index].damage;
          _money -= events[index].price;
          events[index].enable = 0;
        }
      }
    });
  }

  void next_boss() {
    setState(() {
      if (numberboss <= bosses.length - 1) {
        if (numberboss <= _maxBossKilled) {
          numberboss += 1;
          _bossHp = bosses[numberboss - 1].hp;
        }
      }
    });
  }

  void previous_boss() {
    setState(() {
      if (numberboss >= 2) {
        numberboss -= 1;
        _bossHp = bosses[numberboss - 1].hp;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
            "${bosses[numberboss - 1].name} Hp: $_bossHp   Lvl: $numberboss         Money: $_money "),
        centerTitle: true,
      ),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/forest.jpg"), fit: BoxFit.fill)),
          child: Column(
            children: [
              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    onPressed: () => previous_boss(),
                    child: Text("Previous Boss")),
              ),
              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    onPressed: () => {
                          next_boss(),
                        },
                    child: Text("Next Boss")),
              ),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(height: 350),
                child: GestureDetector(
                  child: Image.asset("${bosses[numberboss - 1].img}"),
                  onTapDown: (TapDownDetails details) => damage(details),
                ),
              ),
              Text("Magazine     Your Damage: $_damage",
                  style: TextStyle(fontSize: 25, color: Colors.green)),
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(15),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: events.length,
                  itemBuilder: (_, index) => Card(
                    child: ListTile(
                      enabled: _isEnable,
                      title: Text("${events[index].name}"),
                      subtitle: Text(
                          "Price: ${events[index].price}   Damage:${events[index].damage}"),
                      leading: Icon(
                        R.broadsword,
                        size: 45,
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.attach_money),
                        onPressed: () => {
                          buy_sword(index),
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
