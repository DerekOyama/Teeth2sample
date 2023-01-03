/// @description networking object
global.isPlaying = false;
global.timeoutnum = 240;
global.timeout = false;
global.net_queue = ds_queue_create();
global.test_mode = false;
global.steam = false;
inbuf = buffer_create(16, buffer_grow, 1);

testing = false;
desynctime = 1000;