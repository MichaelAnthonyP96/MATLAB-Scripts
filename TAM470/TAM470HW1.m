Years = 1998:1:2008;
Tuition_per_year = [21300;23057;24441;25917;27024;28564;29847;31200;32994;34800;36030];
scatter(Years,Tuition_per_year,5,'r','x')
xlabel('Years')
ylabel('Tuition per Year')
legend('Tuition Data')
title('St. Anford University Tuition')
set(gca,'YTick',[21300 23057 24441 25917 27204 28564 29847 31200 32994 34800 36030])