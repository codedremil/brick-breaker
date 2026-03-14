import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';

import '../brick_breaker.dart';

class Bat extends PositionComponent
    with HasGameReference<BrickBreaker> {
    //with DragCallbacks, HasGameReference<BrickBreaker> { 
    //il faut supprimer DragCallbacks sinon il faudra 2 doigts pour faire bouger la bat !
  Bat({
    required this.cornerRadius,
    required super.position,
    required super.size,
  }) : super(anchor: Anchor.center, children: [RectangleHitbox()]);

  final Radius cornerRadius;

  final _paint = Paint()
    ..color = const Color(0xff1e6091)
    ..style = PaintingStyle.fill;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRRect(
      RRect.fromRectAndRadius(Offset.zero & size.toSize(), cornerRadius),
      _paint,
    );
  }

  // Pour que la raquette puisse être déplacée quelle que soit
  // la position du doigt à l'écran, on déplace la gestion du Detector au niveau du jeu
  /*
  @override
  void onDragUpdate(DragUpdateEvent event) {
    super.onDragUpdate(event);
    position.x = (position.x + event.localDelta.x).clamp(0, game.width);
  }
  */

  // appelée quand on déplace avec le doigt
  void move(double deltax) {
    moveBy(deltax);
    //position.x = (position.x + deltax).clamp(0, game.width);
  }

  // appelée quand on utilise les touches du clavier
  void moveBy(double dx) {
    add(
      MoveToEffect(
        Vector2((position.x + dx).clamp(0, game.width), position.y),
        EffectController(duration: 0.1),
      ),
    );
  }
}
