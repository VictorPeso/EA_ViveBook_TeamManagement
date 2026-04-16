function dias = diasEntreFechas(fechaInicioStr, fechaFinalStr, nombreFichero)

    % Si no se indica nombre de fichero, usar uno por defecto
    if nargin < 3
        nombreFichero = 'dias_entre_fechas.txt';
    end

    % Año actual
    anio = year(datetime('today'));

    % Lista de meses en español
    meses = ["Enero","Febrero","Marzo","Abril","Mayo","Junio", ...
             "Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"];

    % Separar día y mes
    partesInicio = split(strtrim(fechaInicioStr));
    partesFinal  = split(strtrim(fechaFinalStr));

    diaInicio = str2double(partesInicio{1});
    diaFinal  = str2double(partesFinal{1});

    mesInicio = find(strcmpi(meses, partesInicio{2}));
    mesFinal  = find(strcmpi(meses, partesFinal{2}));

    % Comprobación de meses válidos
    if isempty(mesInicio) || isempty(mesFinal)
        error('Nombre de mes no válido.');
    end

    % Crear fechas datetime
    fechaInicio = datetime(anio, mesInicio, diaInicio);
    fechaFinal  = datetime(anio, mesFinal, diaFinal);

    % Comprobación
    if fechaFinal < fechaInicio
        error('La fecha final debe ser posterior a la fecha inicial');
    end

    % Vector de días
    dias = fechaInicio:fechaFinal;

    % Convertir al formato DD-MM
    diasTexto = cellstr(datestr(dias, 'dd-mm') + " 0");

    % Escribir en fichero TXT
    fid = fopen(nombreFichero, 'w');
    if fid == -1
        error('No se pudo crear el fichero %s', nombreFichero);
    end

    for i = 1:length(diasTexto)
        fprintf(fid, '%s\n', diasTexto{i});
    end

    fclose(fid);

    fprintf('Fichero creado correctamente: %s\n', nombreFichero);

end