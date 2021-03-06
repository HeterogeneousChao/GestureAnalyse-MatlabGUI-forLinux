%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% 

global record_count1 record_count2 record_count3 record_dat1 record_dat2 record_dat3;

global record_angle;
global save_file;
global handles_ana;




% % % save_file_name = get(handles_ana.edit_savepath, 'string');
% % % 
% % % if (strcmpi(save_file_name, '') ~= 1)
% % %     
% % % % % %     save_file_fid = fopen(save_file_name, 'w+');
% % % % % %     count1 = fwrite(save_file_fid, record_dat1, 'float');
% % % % % %     count2 = fwrite(save_file_fid, record_dat2, 'float');
% % % % % %     count3 = fwrite(save_file_fid, record_dat3, 'float');
% % % % % %     count4 = fwrite(save_file_fid, record_angle, 'float');
% % % 
% % % save save_file_name record_dat1 record_dat2 record_dat3 record_angle;
% % % 
% % % end

if (strcmpi(save_file, '') ~= 1) 
    
   save_fid = fopen(save_file, 'wt');
   
   record_count = min(record_count1, record_count2);
   record_count = min(record_count, record_count3);
   
   for index_i = 1 : record_count
       fprintf(save_fid, '%d\t%4.4f\t%4.4f\t%4.4f\t%4.4f\t%4.4f\t%4.4f\t%4.4f\t%4.4f\t%4.4f\n', ...
           record_dat1(index_i,1), record_dat1(index_i,2),record_dat1(index_i,3),record_dat1(index_i,4),...
           record_dat1(index_i,5),record_dat1(index_i,6),record_dat1(index_i,7),...
           record_dat1(index_i,8),record_dat1(index_i,9),record_dat1(index_i,10));
       
       fprintf(save_fid, '%d\t%4.4f\t%4.4f\t%4.4f\t%4.4f\t%4.4f\t%4.4f\t%4.4f\t%4.4f\t%4.4f\n', ...
           record_dat2(index_i,1), record_dat2(index_i,2),record_dat2(index_i,3),record_dat2(index_i,4),...
           record_dat2(index_i,5),record_dat2(index_i,6),record_dat2(index_i,7),...
           record_dat2(index_i,8),record_dat2(index_i,9),record_dat2(index_i,10));
        
       fprintf(save_fid, '%d\t%4.4f\t%4.4f\t%4.4f\t%4.4f\t%4.4f\t%4.4f\t%4.4f\t%4.4f\t%4.4f\n', ...
           record_dat3(index_i,1), record_dat3(index_i,2),record_dat3(index_i,3),record_dat3(index_i,4),...
           record_dat3(index_i,5),record_dat3(index_i,6),record_dat3(index_i,7),...
           record_dat3(index_i,8),record_dat3(index_i,9),record_dat3(index_i,10));
   end
   
   fclose(save_fid);
   
   save_datfile = [save_file, '.dat'];
   save save_datfile record_dat1 record_dat2 record_dat3 -ascii
   
end




% % % % fclrecord_dat1(index_i,1), record_dat1(index_i,2),record_dat1(index_i,3),record_dat1(index_i,4)ose(save_file_fid);