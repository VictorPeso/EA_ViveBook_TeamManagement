% GRAFICA DE PUNTOS QUEMADOS

% Datos
dias = diasEntreFechas('12 Abril','3 Mayo');
puntos_totales = 23;
% puntos = [1:length(dias)];  % Número de puntos por día
puntos_p = ones(1,length(dias))*puntos_totales;
puntos_quemados_t = [0 % 12 Abril
    0
    0
    0 % 15
    0
    0
    0
    0
    5 % 20
    0
    0
    0
    0
    5 % 25
    0
    0
    0
    0
    8 %30
    0
    0
    5]; % 3 Mayo

puntos_quemados = transpose(puntos_quemados_t);

puntos = quemar(puntos_p,puntos_quemados);

% Calcular la línea ideal
linea_ideal = puntos_totales * (1 - (0:length(dias)) / (length(dias)-1));

% Crear gráfica
x = 1:numel(dias);
figure
plot(x, puntos, '-b', 'LineWidth', 2)
hold on
plot(linea_ideal, '-r', 'LineWidth', 1)

% Personalización
grid on
xticks(x)
xticklabels(string(dias,'dd MMMM'))
xtickangle(45)
xlabel('Días')
ylabel('Número de puntos')
title('Puntos quemados durante el SPRINT X')
xlim([1 numel(dias)])        % Limita eje X primer día y ultimo día
ylim([0 30])                 % Limita eje Y de 0 a un maxim possible de 30 puntos
yline(puntos_totales, '--', 'Puntos iniciales: ' + string(puntos_totales), 'LabelHorizontalAlignment','left', 'LabelVerticalAlignment','top');
xline(x(length(x)-7), '--r', '1 semana');