headstage_source='eCube';  %options: 'UCLA' or 'Intan' or 'eCube'.  Value must be entered as a string.

if strcmp(headstage_source, 'UCLA')
    disp('Using the UCLA 64 ch amplifier board')
elseif strcmp(headstage_source, 'Intan')
    disp('Using the Intan 128 ch amplifier board')
elseif strcmp(headstage_source, 'eCube')
    disp('Using the Whitematter 64 ch amplifier board')
else
    disp('Please contact me to add your new headstage')
end