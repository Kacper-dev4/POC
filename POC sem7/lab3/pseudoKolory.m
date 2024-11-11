function [pseudo, obszary] = pseudoKolory(img)


[Lp,obszary] = bwlabel(img);
pseudo = label2rgb(Lp);%, 'jet', 'w', 'shuffle'); 



end

