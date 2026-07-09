% --- workflow-full-script-start ---
% --- block-1-start ---
root = fileparts(fileparts(mfilename('fullpath')));
figureOutDir = fullfile(root, 'Figure');
if ~exist(figureOutDir, 'dir'), mkdir(figureOutDir); end
assert(~isempty(which('EasyPlot.figure')), 'EasyPlot not found on MATLAB path');
rng(7);
fig = EasyPlot.figure('Visible', 'on');
% --- block-1-end ---

% --- block-2-start ---
ax_grid = EasyPlot.createGridAxes(fig, 2, 2, ...
    'Width', 2.8, ...
    'Height', 2.35, ...
    'MarginLeft', 0.95, ...
    'MarginBottom', 1.0, ...
    'MarginTop', 0.5, ...
    'MarginRight', 0.55, ...
    'FontSize', 7);
EasyPlot.set(ax_grid{1,1}, 'XAxisVisible', 'off');

ax_profile = EasyPlot.createAxesAgainstAxes(fig, ax_grid{1,2}, 'right', ...
    'Width', 0.8, ...
    'Height', 2.35, ...
    'MarginLeft', 0.45, ...
    'MarginRight', 1.25, ...
    'FontSize', 7, ...
    'YAxisVisible', 'off');
ax_top = ax_grid(1,:);
ax_bottom = ax_grid(2,:);
ax_heatmap_group = {ax_grid{1,2}, ax_profile};
% --- block-2-end ---

% --- block-3-start ---
t = linspace(0, 10, 300);
signal_a = sin(2*pi*0.35*t) .* exp(-0.08*t);
signal_b = 0.75*cos(2*pi*0.35*t - 0.7) .* exp(-0.08*t);
h_a = plot(ax_grid{1,1}, t, signal_a, '-', 'Color', [0.10, 0.35, 0.75], 'LineWidth', 1.1);
h_b = plot(ax_grid{1,1}, t, signal_b, '-', 'Color', [0.85, 0.30, 0.20], 'LineWidth', 1.1);

trial_idx = 1:40;
response_map = sin(2*pi*0.22*t) + 0.12*trial_idx';
response_map = response_map + 0.25*randn(numel(trial_idx), numel(t));
imagesc(ax_grid{1,2}, t, trial_idx, response_map);

scatter_x = randn(160, 1);
scatter_y = 0.65*scatter_x + 0.35*randn(160, 1) + 0.2;
scatter(ax_grid{2,1}, scatter_x, scatter_y, 12, [0.20, 0.55, 0.35], 'filled', ...
    'MarkerFaceAlpha', 0.55, 'MarkerEdgeColor', 'none');

residual = scatter_y - 0.65*scatter_x;
histogram(ax_grid{2,2}, residual, 18, ...
    'FaceColor', [0.35, 0.35, 0.35], ...
    'EdgeColor', 'none');

profile_trials = mean(response_map, 2);
plot(ax_profile, profile_trials, trial_idx, 'k-', 'LineWidth', 1.0);
% --- block-3-end ---

% --- block-4-start ---
EasyPlot.set(ax_grid{1,2}, 'YDir', 'normal');
EasyPlot.setXLim(ax_top, [0, 10]);
EasyPlot.setXTicksAndLabels(ax_top, [0, 5, 10], {'0', '5', '10'});
EasyPlot.setGeneralXLabel(ax_top, 'Time (s)');
EasyPlot.setYTicksAndLabels(ax_heatmap_group, [1, 20, 40], {'1', '20', '40'});
EasyPlot.setYTicksAndLabels(ax_profile, [1, 20, 40], {'', '', ''});
EasyPlot.setYLim(ax_heatmap_group, [1, 40]);

xlim(ax_grid{2,1}, [-2.6, 2.6]);
ylim(ax_grid{1,1}, [-1.0, 1.2]);
ylim(ax_grid{2,1}, [-2.1, 2.5]);
xlim(ax_grid{2,2}, [-1.8, 1.8]);
ylim(ax_grid{2,2}, [0, 26]);
xlim(ax_profile, [min(profile_trials)-0.2, max(profile_trials)+0.2]);
xlabel(ax_profile, 'X', 'FontSize', 7);
title(ax_profile, 'Side panel', 'FontSize', 7);

ylabel(ax_grid{1,1}, 'Amplitude (a.u.)', 'FontSize', 7);
ylabel(ax_grid{1,2}, 'Trial', 'FontSize', 7);
xlabel(ax_grid{2,1}, 'Predictor', 'FontSize', 7);
ylabel(ax_grid{2,1}, 'Response', 'FontSize', 7);
xlabel(ax_grid{2,2}, 'Residual', 'FontSize', 7);
ylabel(ax_grid{2,2}, 'Count', 'FontSize', 7);

title(ax_grid{1,1}, 'Signals', 'FontSize', 7);
title(ax_grid{1,2}, 'Heatmap', 'FontSize', 7);
title(ax_grid{2,1}, 'Scatter', 'FontSize', 7);
title(ax_grid{2,2}, 'Residual histogram', 'FontSize', 7);
% --- block-4-end ---

% --- block-5-start ---
h_legend = EasyPlot.legend(ax_grid{1,1}, {'Condition A', 'Condition B'}, ...
    'selectedPlots', [h_a, h_b], ...
    'location', 'northeast', ...
    'lineLength', 0.3, ...
    'fontSize', 7);
EasyPlot.setCLim(ax_grid{1,2}, [-2.2, 2.2]);
EasyPlot.colormap(ax_grid{1,2}, EasyPlot.ColorMap.Diverging.coolwarm, ...
    'zeroCenter', 'on', 'zeroPosition', 0);
h_colorbar = EasyPlot.colorbar(ax_grid{1,2}, ...
    'Location', 'southoutside', ...
    'Label', 'Response (a.u.)', ...
    'Height', 0.16, ...
    'Width', 0.72, ...
    'MarginBottom', 0.95, ...
    'FontSize', 7);
h_scalebar = EasyPlot.scalebar(ax_grid{1,1}, 'X', ...
    'location', 'southwest', ...
    'xBarLength', 2, ...
    'xBarRatio', 1, ...
    'xBarLabel', '2 s', ...
    'fontSize', 7, ...
    'fontWeight', 'normal');
h_marks = EasyPlot.markAxes(fig, ax_grid, {'A', 'B', 'C', 'D'}, ...
    'fontName', 'Arial', ...
    'fontSize', 8, ...
    'fontWeight', 'bold');
% --- block-5-end ---

% --- block-6-start ---
EasyPlot.move(ax_grid(:,2), 'dx', 0.10);
EasyPlot.move(ax_bottom, 'dy', -0.45);
EasyPlot.align(ax_profile, ax_grid{1,2}, 'bottom');
EasyPlot.place(ax_profile, ax_grid{1,2}, 'right');
EasyPlot.move(ax_profile, 'dx', -0.70);
EasyPlot.move(h_colorbar, 'dy', -0.02);
EasyPlot.move(h_legend, 'dx', 0.3, 'dy', 0.2);
EasyPlot.move(h_scalebar, 'dx', 0.12, 'dy', -0.2);
EasyPlot.move(num2cell(h_marks), 'dx', 0.08, 'dy', 0.02);
% --- block-6-end ---

% --- block-7-start ---
EasyPlot.cropFigure(fig);
EasyPlot.exportFigure(fig, fullfile(figureOutDir, 'publication_workflow.png'));
EasyPlot.exportFigure(fig, fullfile(figureOutDir, 'publication_workflow'), 'type', 'pdf');
% --- block-7-end ---
% --- workflow-full-script-end ---













