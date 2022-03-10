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

1	0	0	600	4
2	0	0	560	4
3	0	0	520	4
4	0	0	480	4
5	0	0	440	4
6	0	0	400	4
7	0	0	360	4
8	0	0	320	4
9	0	0	280	4
10	0	0	240	4
11	0	0	200	4
12	0	0	160	4
13	0	0	120	4
14	0	0	80	4
15	0	0	40	4
16	0	0	0	4
17	0	0	20	4
18	0	0	60	4
19	0	0	100	4
20	0	0	140	4
21	0	0	180	4
22	0	0	220	4
23	0	0	260	4
24	0	0	300	4
25	0	0	340	4
26	0	0	380	4
27	0	0	420	4
28	0	0	460	4
29	0	0	500	4
30	0	0	540	4
31	0	0	580	4
32	0	0	620	4
33	200	0	600	3
34	200	0	560	3
35	200	0	520	3
36	200	0	480	3
37	200	0	440	3
38	200	0	400	3
39	200	0	360	3
40	200	0	320	3
41	200	0	280	3
42	200	0	240	3
43	200	0	200	3
44	200	0	160	3
45	200	0	120	3
46	200	0	80	3
47	200	0	40	3
48	200	0	0	3
49	200	0	20	3
50	200	0	60	3
51	200	0	100	3
52	200	0	140	3
53	200	0	180	3
54	200	0	220	3
55	200	0	260	3
56	200	0	300	3
57	200	0	340	3
58	200	0	380	3
59	200	0	420	3
60	200	0	460	3
61	200	0	500	3
62	200	0	540	3
63	200	0	580	3
64	200	0	620	3
65	400	0	600	2
66	400	0	560	2
67	400	0	520	2
68	400	0	480	2
69	400	0	440	2
70	400	0	400	2
71	400	0	360	2
72	400	0	320	2
73	400	0	280	2
74	400	0	240	2
75	400	0	200	2
76	400	0	160	2
77	400	0	120	2
78	400	0	80	2
79	400	0	40	2
80	400	0	0	2
81	400	0	20	2
82	400	0	60	2
83	400	0	100	2
84	400	0	140	2
85	400	0	180	2
86	400	0	220	2
87	400	0	260	2
88	400	0	300	2
89	400	0	340	2
90	400	0	380	2
91	400	0	420	2
92	400	0	460	2
93	400	0	500	2
94	400	0	540	2
95	400	0	580	2
96	400	0	620	2
97	600	0	600	1
98	600	0	560	1
99	600	0	520	1
100	600	0	480	1
101	600	0	440	1
102	600	0	400	1
103	600	0	360	1
104	600	0	320	1
105	600	0	280	1
106	600	0	240	1
107	600	0	200	1
108	600	0	160	1
109	600	0	120	1
110	600	0	80	1
111	600	0	40	1
112	600	0	0	1
113	600	0	20	1
114	600	0	60	1
115	600	0	100	1
116	600	0	140	1
117	600	0	180	1
118	600	0	220	1
119	600	0	260	1
120	600	0	300	1
121	600	0	340	1
122	600	0	380	1
123	600	0	420	1
124	600	0	460	1
125	600	0	500	1
126	600	0	540	1
127	600	0	580	1
128	600	0	620	1

];


tipelectrode=46;    %nearest tip-electrode vertical distance in microns.

connector_position='bottom';

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
figure(3)
clf
plot(s.x,s.z,'sqr', 'MarkerSize',11)
hold on
for i=1:size(probewiring,1)
text(s.x(i)-5,s.z(i),num2str(s.channels(i)),'FontSize',9)
end
axis([min(s.x)-50 max(s.x)+50 min(s.z)-50 max(s.z)+50])
axis equal
set(gca,'FontSize',10,'TickDir','out')
