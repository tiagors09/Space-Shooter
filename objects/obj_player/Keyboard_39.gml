x += velocity;

if (x+(sprite_width/2) >= room_width) {
    x =  room_width - (sprite_width/2);
}