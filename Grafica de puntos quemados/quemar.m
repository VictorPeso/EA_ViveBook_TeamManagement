function [puntos] = quemar(totales,quemados)

puntos = totales;

for i = 1:length(totales)
    if quemados(i) > 0
        for j = i:length(totales)
            puntos(j) = puntos(j) - quemados(i);
        end
    end
end

end