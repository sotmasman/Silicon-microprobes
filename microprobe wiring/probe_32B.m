%first column = channel number on probe.  Convention is ch. 1 is at top left of PCB
%and number wrap around in counter-clockwise fashion.

%second column = x coordinate, horizontal distance to reference electrode in microns.  Convention is
%for reference electrode to be at bottom left corner of array when array
%points up.

%third column = y coordinate.  Convention is for this coordinate to be zero
%unless the probe is 3D.

%forth column = z coordinate, vertical distance to reference electrode in microns.  Convention is
%for reference electrode to be at bottom left corner of array when array
%points up.

%fifth column = shaft number.  Convention is for shaft 1 to be the
%right-most shaft when array points up.

probewiring=[
1	0	0	350	1
2	0	0	300	1
3	0	0	250	1
4	0	0	200	1
5	0	0	150	1
6	0	0	100	1
7	0	0	50	1
8	0	0	0	1
9	0	0	400	1
10	0	0	450	1
11	0	0	500	1
12	0	0	550	1
13	0	0	600	1
14	0	0	650	1
15	0	0	700	1
16	4.3	0	750	1
17	12.5	0	775	1
18	25	0	725	1
19	25	0	675	1
20	25	0	625	1
21	25	0	575	1
22	25	0	525	1
23	25	0	475	1
24	25	0	425	1
25	25	0	375	1
26	25	0	25	1
27	25	0	75	1
28	25	0	125	1
29	25	0	175	1
30	25	0	225	1
31	25	0	275	1
32	25	0	325	1
];


tipelectrode=80;    %nearest tip-electrode vertical distance in microns.

connector_position='top';

find_probewiring



s=[];
s.channels=probewiring(:,1);
s.x=probewiring(:,2);   %the reference electrode is always the top right channel when the probes are pointing up.
s.y=probewiring(:,3);
s.z=probewiring(:,4); s.z=s.z-min(s.z);
s.shaft=probewiring(:,5);
s.tipelectrode=tipelectrode;

if strcmp(headstage_source,'Intan')
    s.channels=s.channels-1;
end

%To plot the labeled channels:
figure(2)
clf
plot(s.x,s.z,'sqr', 'MarkerSize',11)
hold on
for i=1:size(probewiring,1)
text(s.x(i)-5,s.z(i),num2str(s.channels(i)),'FontSize',9)
end
axis([min(s.x)-50 max(s.x)+50 min(s.z)-50 max(s.z)+50])
axis equal
set(gca,'FontSize',10,'TickDir','out')
