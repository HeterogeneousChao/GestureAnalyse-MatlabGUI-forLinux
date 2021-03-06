function sub_f_callback(s, BytesAvailable, handles, editout, edit, edit14, edit24, edit34, edit15, edit25, edit35, edit16, edit26, edit36, edit17, edit27, edit37)
    
    global dat datLen;
    global PlotAxes PlotAxesLen PlotAxes_t  axes_plot hx hy hz; 
    global edit_index;
    global O_Rm O_Rm2;
    
        
    global dat2;
    global PlotAxes2 PlotAxes_t2  axes_plot2 hx2 hy2 hz2; 
    global edit_index2;
    
    global dat3;
    global hx3 hy3 hz3 axes_plot3 PlotAxes3 PlotAxes_t3;
    
    global offset_x offset_y offset_z offset_g_x offset_g_y offset_g_z offset_a_x offset_a_y offset_a_z;
    
    
    global record_count1 record_count2 record_count3 start_record record_dat1 record_dat2 record_dat3;
    
    global tmp_index;
    
    
    global  haccx1 haccy1 haccz1 haccx2 haccy2 haccz2 haccx3 haccy3 haccz3;
    global  PlotAxes_acc1 PlotAxes_acc2 PlotAxes_acc3;
    
    
    out = fscanf(s);  
    data = str2num(out);  
    
    if size(data, 2) == 10 
    
        if data(1) == 0
            tmp_index = tmp_index + 1;
            
            if (start_record == 1)
               record_dat1 = [record_dat1 ; data];
               record_count1 = record_count1 + 1;
               record_count_tmp = sprintf('%d : %d : %d ', record_count1, record_count2, record_count3);
               set(handles.editrecordnum, 'string', record_count_tmp);
            end
            
            plotdat_tmp = [data(2), data(3), data(4)]';

            PlotAxes = [plotdat_tmp, PlotAxes(:, 1:PlotAxesLen-1)];


            dat_tmp = zeros(9, 1);

            dat_tmp(1,1) = data(2) - offset_x;
            dat_tmp(2,1) = data(3) - offset_y;
            dat_tmp(3,1) = data(4) - offset_z;

            dat_tmp(4,1) = data(5) - offset_g_x;
            dat_tmp(5,1) = data(6) - offset_g_y;
            dat_tmp(6,1) = data(7) - offset_g_z;

            dat_tmp(7,1) = data(8) - offset_a_x;
            dat_tmp(8,1) = data(9) - offset_a_y;
            dat_tmp(9,1) = data(10) - offset_a_z;
            
            plotdat_tmp = [data(8)/7, data(9)/7, data(10)/7]';
            
            PlotAxes_acc1 = [plotdat_tmp, PlotAxes_acc1(:, 1:PlotAxesLen-1)];

            dat = [dat(:, 2:datLen), dat_tmp];

            if edit_index >= 15
                set(edit, 'string', '');
                edit_index = 0;
            end

            result_tmp = get(edit, 'string');

            str_dat = sprintf('[r-1#]: %8.4f, %8.4f, %8.4f', data(1), data(2), data(3));
            result_tmp = strvcat(result_tmp, str_dat);
            str_dat = sprintf('[g-1#]: %8.4f, %8.4f, %8.4f', data(4), data(5), data(6));
            result_tmp = strvcat(result_tmp, str_dat);
            str_dat = sprintf('[a-1#]: %8.4f, %8.4f, %8.4f\n', data(7), data(8), data(9));
            result_tmp = strvcat(result_tmp, str_dat);


            set(edit, 'string', result_tmp );
            edit_index = edit_index + 1;

        % % %     set(edit11, 'string', sprintf('%8.4f', dat_tmp(1,1)));
        % % %     set(edit21, 'string', sprintf('%8.4f', dat_tmp(2,1)));
        % % %     set(edit31, 'string', sprintf('%8.4f', dat_tmp(3,1)));

        % % %     set(edit12, 'string', sprintf('%8.4f', 0));
        % % %     set(edit22, 'string', sprintf('%8.4f', 0));
        % % %     set(edit32, 'string', sprintf('%8.4f', 0));
        % % %     [
        % % %     set(edit13, 'string', sprintf('%8.4f', 0));
        % % %     set(edit23, 'string', sprintf('%8.4f', 0));
        % % %     set(edit33, 'string', sprintf('%8.4f', 0));
        % % %     


            set(edit15, 'string', sprintf('%8.4f', dat_tmp(1,1)));
            set(edit25, 'string', sprintf('%8.4f', dat_tmp(2,1)));
            set(edit35, 'string', sprintf('%8.4f', dat_tmp(3,1)));

            set(edit16, 'string', sprintf('%8.4f', dat_tmp(4,1)));
            set(edit26, 'string', sprintf('%8.4f', dat_tmp(5,1)));
            set(edit36, 'string', sprintf('%8.4f', dat_tmp(6,1)));

            set(edit17, 'string', sprintf('%8.4f', dat_tmp(7,1)));
            set(edit27, 'string', sprintf('%8.4f', dat_tmp(8,1)));
            set(edit37, 'string', sprintf('%8.4f', dat_tmp(9,1)));

        % % %     axes(handles.axes4);
        % % %     hold off;

                  set(hx, 'XData', PlotAxes_t, 'YData', PlotAxes(1,:));
                  set(hy, 'XData', PlotAxes_t, 'YData', PlotAxes(2,:));
                  set(hz, 'XData', PlotAxes_t, 'YData', PlotAxes(3,:));
                    
                  set(haccx1, 'XData', PlotAxes_t, 'YData', PlotAxes_acc1(1,:));
                  set(haccy1, 'XData', PlotAxes_t, 'YData', PlotAxes_acc1(2,:));
                  set(haccz1, 'XData', PlotAxes_t, 'YData', PlotAxes_acc1(3,:));
                  
                  O_Rm = dat(:, size(dat, 2));
                  if ~isequal(O_Rm, zeros(9,1))
                        CB_PlotCoornidate1;
                  end


%                   drawnow  



        % % %     plot(PlotAxes_t, PlotAxes(1,:), '-^g');
        % % %     hold on;
        % % %     plot(PlotAxes_t, PlotAxes(2,:), '-sb');
        % % %     plot(PlotAxes_t, PlotAxes(2,:), '-*r');
        % % %     
        % % %     axis([0, PlotAxesLen, -4, 4]);
        % % %     
        % % %     legend('X-angle', 'Y-angle', 'Z-angle');
        % % %     guidata(hObject, handles);


        % % %     axes( axes_plottmp);
        % % %     axis([0, PlotAxesLen, -4, 4]);

        % % %     plot(PlotAxes_t, PlotAxes(1,:), '-^g');
        % % %     hold on;
        % % %     plot(PlotAxes_t, PlotAxes(2,:), '-sb');
        % % %     plot(PlotAxes_t, PlotAxes(2,:), '-*r');
        % % % 
        % % %     grid on;
        % % %      axis([0, PlotAxesLen, -7, 7]);
        % % % 
        % % %     legend('X-angle', 'Y-angle', 'Z-angle');
        % % %     
        end


        data2 = str2num(out); 

        if  data2(1) == 1
            
            tmp_index = tmp_index + 1;
            
            if (start_record == 1)
               record_dat2 = [record_dat2 ; data];
               record_count2 = record_count2 + 1;
               record_count_tmp = sprintf('%d : %d : %d ', record_count1, record_count2, record_count3);
               set(handles.editrecordnum, 'string', record_count_tmp);
            end
            
            plotdat_tmp = [data2(2), data2(3), data2(4)]';

            PlotAxes2 = [plotdat_tmp, PlotAxes2(:, 1:PlotAxesLen-1)];
            

            dat_tmp = zeros(9, 1);

            dat_tmp(1,1) = data2(2) - offset_x;
            dat_tmp(2,1) = data2(3) - offset_y;
            dat_tmp(3,1) = data2(4) - offset_z;

            dat_tmp(4,1) = data2(5) - offset_g_x;
            dat_tmp(5,1) = data2(6) - offset_g_y;
            dat_tmp(6,1) = data2(7) - offset_g_z;

            dat_tmp(7,1) = data2(8) - offset_a_x;
            dat_tmp(8,1) = data2(9) - offset_a_y;
            dat_tmp(9,1) = data2(10) - offset_a_z;

             
            plotdat_tmp = [data2(8)/7, data(9)/7, data(10)/7]';
            
            PlotAxes_acc2 = [plotdat_tmp, PlotAxes_acc2(:, 1:PlotAxesLen-1)];
            
            dat2 = [dat2(:, 2:datLen), dat_tmp];

            if edit_index2 >= 15
                set(edit, 'string', '');
                edit_index2 = 0;
            end

            result_tmp = get(edit, 'string');

            str_dat = sprintf('[r-2#]: %8.4f, %8.4f, %8.4f', data2(1), data2(2), data2(3));
            result_tmp = strvcat(result_tmp, str_dat);
            str_dat = sprintf('[g-2#]: %8.4f, %8.4f, %8.4f', data2(4), data2(5), data2(6));
            result_tmp = strvcat(result_tmp, str_dat);
            str_dat = sprintf('[a-2#]: %8.4f, %8.4f, %8.4f\n', data2(7), data2(8), data2(9));
            result_tmp = strvcat(result_tmp, str_dat);


            set(edit, 'string', result_tmp );
            edit_index2 = edit_index2 + 1;

        % % %     set(edit11, 'string', sprintf('%8.4f', dat_tmp(1,1)));
        % % %     set(edit21, 'string', sprintf('%8.4f', dat_tmp(2,1)));
        % % %     set(edit31, 'string', sprintf('%8.4f', dat_tmp(3,1)));

        % % %     set(edit12, 'string', sprintf('%8.4f', 0));
        % % %     set(edit22, 'string', sprintf('%8.4f', 0));
        % % %     set(edit32, 'string', sprintf('%8.4f', 0));
        % % %     
        % % %     set(edit13, 'string', sprintf('%8.4f', 0));
        % % %     set(edit23, 'string', sprintf('%8.4f', 0));
        % % %     set(edit33, 'string', sprintf('%8.4f', 0));
        % % %     


            set(edit15, 'string', sprintf('%8.4f', dat_tmp(1,1)));
            set(edit25, 'string', sprintf('%8.4f', dat_tmp(2,1)));
            set(edit35, 'string', sprintf('%8.4f', dat_tmp(3,1)));

            set(edit16, 'string', sprintf('%8.4f', dat_tmp(4,1)));
            set(edit26, 'string', sprintf('%8.4f', dat_tmp(5,1)));
            set(edit36, 'string', sprintf('%8.4f', dat_tmp(6,1)));

            set(edit17, 'string', sprintf('%8.4f', dat_tmp(7,1)));
            set(edit27, 'string', sprintf('%8.4f', dat_tmp(8,1)));
            set(edit37, 'string', sprintf('%8.4f', dat_tmp(9,1)));

        % % %     axes(handles.axes4);
        % % %     hold off;

                  set(hx2, 'XData', PlotAxes_t2, 'YData', PlotAxes2(1,:));
                  set(hy2, 'XData', PlotAxes_t2, 'YData', PlotAxes2(2,:));
                  set(hz2, 'XData', PlotAxes_t2, 'YData', PlotAxes2(3,:));
                  
                  set(haccx2, 'XData', PlotAxes_t2, 'YData', PlotAxes_acc2(1,:));
                  set(haccy2, 'XData', PlotAxes_t2, 'YData', PlotAxes_acc2(2,:));
                  set(haccz2, 'XData', PlotAxes_t2, 'YData', PlotAxes_acc2(3,:));

                  O_Rm2 = dat2(:, size(dat2, 2));
                  if ~isequal(O_Rm2, zeros(9,1))
                        CB_PlotCoornidate2;
                        CB_PlotCoornidateAxes2;
                  end


%                   drawnow  



        % % %     plot(PlotAxes_t, PlotAxes(1,:), '-^g');
        % % %     hold on;
        % % %     plot(PlotAxes_t, PlotAxes(2,:), '-sb');
        % % %     plot(PlotAxes_t, PlotAxes(2,:), '-*r');
        % % %     
        % % %     axis([0, PlotAxesLen, -4, 4]);
        % % %     
        % % %     legend('X-angle', 'Y-angle', 'Z-angle');
        % % %     guidata(hObject, handles);


        % % %     axes( axes_plottmp);
        % % %     axis([0, PlotAxesLen, -4, 4]);

        % % %     plot(PlotAxes_t, PlotAxes(1,:), '-^g');
        % % %     hold on;
        % % %     plot(PlotAxes_t, PlotAxes(2,:), '-sb');
        % % %     plot(PlotAxes_t, PlotAxes(2,:), '-*r');
        % % % 
        % % %     grid on;
        % % %      axis([0, PlotAxesLen, -7, 7]);
        % % % 
        % % %     legend('X-angle', 'Y-angle', 'Z-angle');
        % % %     
        end
        
        
        data3 = str2num(out); 

        if  data3(1) == 2
            
            tmp_index = tmp_index + 1;

            if (start_record == 1)
               record_dat3 = [record_dat3 ; data];
               record_count3 = record_count3 + 1;
               record_count_tmp = sprintf('%d : %d : %d ', record_count1, record_count2, record_count3);
               set(handles.editrecordnum, 'string', record_count_tmp);
            end

            plotdat_tmp = [data3(2), data3(3), data3(4)]';

            PlotAxes3 = [plotdat_tmp, PlotAxes3(:, 1:PlotAxesLen-1)];


            dat_tmp = zeros(3, 1);

            dat_tmp(1,1) = data3(2);
            dat_tmp(2,1) = data3(3);
            dat_tmp(3,1) = data3(4);
            
            plotdat_tmp = [data3(8)/7, data(9)/7, data(10)/7]';
            
            PlotAxes_acc3 = [plotdat_tmp, PlotAxes_acc3(:, 1:PlotAxesLen-1)];


            dat3 = [dat3(:, 2:datLen), dat_tmp];

            if edit_index2 >= 15
                set(edit, 'string', '');
                edit_index2 = 0;
            end

            result_tmp = get(edit, 'string');

            str_dat = sprintf('[out]: %8.4f, %8.4f, %8.4f', data2(2), data2(3), data2(4));
            result_tmp = strvcat(result_tmp, str_dat);

            set(edit, 'string', result_tmp );
            edit_index2 = edit_index2 + 1;


        % % %     axes(handles.axes4);
        % % %     hold off;

                  set(hx3, 'XData', PlotAxes_t3, 'YData', PlotAxes3(1,:));
                  set(hy3, 'XData', PlotAxes_t3, 'YData', PlotAxes3(2,:));
                  set(hz3, 'XData', PlotAxes_t3, 'YData', PlotAxes3(3,:));
                  
                  set(haccx3, 'XData', PlotAxes_t3, 'YData', PlotAxes_acc3(1,:));
                  set(haccy3, 'XData', PlotAxes_t3, 'YData', PlotAxes_acc3(2,:));
                  set(haccz3, 'XData', PlotAxes_t3, 'YData', PlotAxes_acc3(3,:));
% 
%                       drawnow  


        % % %     plot(PlotAxes_t, PlotAxes(1,:), '-^g');
        % % %     hold on;
        % % %     plot(PlotAxes_t, PlotAxes(2,:), '-sb');
        % % %     plot(PlotAxes_t, PlotAxes(2,:), '-*r');
        % % %     
        % % %     axis([0, PlotAxesLen, -4, 4]);
        % % %     
        % % %     legend('X-angle', 'Y-angle', 'Z-angle');
        % % %     guidata(hObject, handles);


        % % %     axes( axes_plottmp);
        % % %     axis([0, PlotAxesLen, -4, 4]);

        % % %     plot(PlotAxes_t, PlotAxes(1,:), '-^g');
        % % %     hold on;
        % % %     plot(PlotAxes_t, PlotAxes(2,:), '-sb');
        % % %     plot(PlotAxes_t, PlotAxes(2,:), '-*r');
        % % % 
        % % %     grid on;
        % % %      axis([0, PlotAxesLen, -7, 7]);
        % % % 
        % % %     legend('X-angle', 'Y-angle', 'Z-angle');
        % % %     
        end
        
        
    end
    
% % %     if s.BytesAvailable > 0
% % %         fread(s, s.BytesAvailable, 'uint8'); 
% % %     end
end  