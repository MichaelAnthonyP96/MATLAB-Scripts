Ox = 12; Oy =-20; Txy = 23; Theta = 72.5877;
Oxp = (Ox +Oy)/2 + ((Ox - Oy)/2)*cosd(2*Theta) + Txy*sind(2*Theta)
Oyp = (Ox +Oy)/2 - ((Ox - Oy)/2)*cosd(2*Theta) - Txy*sind(2*Theta)
Txyp = -((Ox -Oy)/2)*sind(2*Theta) + Txy*cosd(2*Theta)
