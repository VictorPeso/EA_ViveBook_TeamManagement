% GRAFICA DE PUNTOS QUEMADOS LEYENDO DESDE TXT

% Parámetros
nombreFichero = 'sprint1.txt';
puntos_totales = 23;
anio = year(datetime('today'));

% Leer fichero
fid = fopen(nombreFichero, 'r');
if fid == -1
    error('No se pudo abrir el fichero %s', nombreFichero);
end

% Leer líneas: formato esperado "DD-MM X"
datos = textscan(fid, '%s %f');
fclose(fid);

fechasStr = datos{1};           % Fechas en texto
puntos_quemados = datos{2};     % Puntos quemados por día

% Convertir fechas a datetime
dias = datetime(fechasStr, 'InputFormat', 'dd-MM');
dias.Year = anio;

% Asegurar vector columna
dias = dias(:);
puntos_quemados = puntos_quemados(:);

% Comprobación
if isempty(dias)
    error('El fichero está vacío o no tiene el formato correcto.');
end

% Calcular puntos restantes
puntos = puntos_totales - cumsum(puntos_quemados);

% Añadir punto inicial
puntos_plot = [puntos_totales; puntos];
x = 1:length(puntos_plot);

% Línea ideal
linea_ideal = linspace(puntos_totales, 0, length(puntos_plot));

% Etiquetas eje X
dias_plot = [dias(1)-days(1); dias];
labelsX = string(dias_plot, 'dd MMMM');

% Crear gráfica
figure
plot(x, puntos_plot, '-b', 'LineWidth', 2)
hold on
plot(x, linea_ideal, '-r', 'LineWidth', 1.5)

% Personalización
grid on
xticks(x)
xticklabels(labelsX)
xtickangle(45)
xlabel('Días')
ylabel('Número de puntos')
title('Puntos quemados durante el SPRINT 1')
xlim([1 length(x)])
ylim([0 max(puntos_totales, max(puntos_plot)) + 5])

yline(puntos_totales, '--', ...
    'Puntos iniciales: ' + string(puntos_totales), ...
    'LabelHorizontalAlignment','left', ...
    'LabelVerticalAlignment','top');

% Línea vertical a una semana del final
if length(x) > 8
    xline(x(length(x)-7), '--r', '1 semana');
end

hold off

hold off