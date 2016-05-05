function err_table = output(Setslog,varargin)

global figure_han saveon ploton

saveon = 0;
ploton = 1;

figure_han = [figure(1) figure(2)];
scrsz = get(0, 'Screensize');
set(figure_han(1), 'OuterPosition', scrsz, 'Color', 'w'); clf
set(figure_han(2), 'OuterPosition', scrsz, 'Color', 'w'); clf

Setslog = importdata(Setslog);
%yl = Setslog.paraname{1,Setslog.out_index};
for i=Setslog.out_index
    yl = ['y',num2str(i)];
    err_table = [];
    for i = 1:Setslog.no_run
        pause(1)
        fprintf('Training data %d\n', i)
        err_table = [err_table; get_trained_data(Setslog, i, yl,varargin{:})];
    end
    disp(['ERROR TABLE for training of ' yl ' by EvoNN:'])
    disp(err_table)

end
