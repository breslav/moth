%plot train/test loss

file_path = 'moth_example/vgg_16_regression_batch_64_finetune';

f = fopen([file_path,'/parsed_log/solver_log_training_iterations.txt'],'r');
training_iterations = fscanf(f,'%d');
fclose(f);

f = fopen([file_path,'/parsed_log/solver_log_training_loss.txt'],'r');
training_loss = fscanf(f,'%f');
fclose(f);

f = fopen([file_path,'/parsed_log/solver_log_testing_iterations.txt'],'r');
testing_iterations = fscanf(f,'%d');
fclose(f);

f = fopen([file_path,'/parsed_log/solver_log_testing_loss.txt'],'r');
testing_loss = fscanf(f,'%f');
fclose(f);

figure(); hold on;
plot(training_iterations,training_loss,'-b','LineWidth',2); hold on;
% gcf;
plot(testing_iterations,testing_loss,'-g','LineWidth',2); hold on;