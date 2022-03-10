get_headstage_source

if strcmp(headstage_source, 'eCube')
    
    eval([headstage_source '_64ch_headstage']) % whitematter provide the mapping from probe to HS, so there is no pcbwiring

else
    if size(probewiring,1)==64
        eval('wiring_64chPCB');
        eval([headstage_source '_128ch_headstage'])
        headstagewiring=headstagewiring(1:64,:);
    elseif size(probewiring,1)==128
        eval('wiring_128chPCB');   
        eval([headstage_source '_128ch_headstage'])
    elseif size(probewiring,1)==256
        eval('wiring_256chPCB');    
        eval([headstage_source '_256ch_headstage']);    
    elseif size(probewiring,1)==32
        eval('wiring_32chPCB');
        eval([headstage_source '_32ch_headstage']);
        headstagewiring=headstagewiring(1:32,:);
    end

    if length(strfind(connector_position, 'bottom'))>0
    pcbwiring=pcbwiring(:,3);
    else pcbwiring=pcbwiring(:,2);
    end

    probewiring(:,1)=pcbwiring;

    [neworder, sortindices]=sort(probewiring(:,1), 'ascend');   

    probewiring=[neworder probewiring(sortindices,2) probewiring(sortindices,3) probewiring(sortindices,4) probewiring(sortindices,5)];

end

probewiring(:,1)=headstagewiring(:,2);

[neworder, sortindices]=sort(probewiring(:,1), 'ascend');   

refchanzind=find(probewiring(:,4)==max(probewiring(:,4))); 
refchanxind=find(probewiring(refchanzind,2)==max(probewiring(refchanzind,2)));
refchan=neworder(refchanzind(refchanxind));
refchan_x=probewiring(refchan,2);     %used to set lower left electrode at origin when probe is facing down.
refchan_z=probewiring(refchan,4);     %used to set lower left electrode at origin when probe is facing down.

probewiring=[neworder -1*probewiring(sortindices,2)+refchan_x probewiring(sortindices,3) -1*probewiring(sortindices,4)+refchan_z probewiring(sortindices,5)];
    