/client
	var/sound/ambient/music			= null		//������
	var/sound/ambient/music_juke	= null		//������ �� ���������
	var/sound/ambient/environment	= null		//��������� �������� ����� ������������� �� ����� 12 ������
	var/sound/ambient/background	= null		//����������� ����
	var/sound/ambient/psy			= null		//���-����
	var/sound/ambient/campfire		= null		//���� �� ������ - campfire.dm

/sound/ambient
	var/last_time = 0
	var/real_cooldown = 0
	var/transition = 0

/mob/proc/handle_sounds()
	if(!src.client)
		return 0

	if(!src.loc)
		return 0

	var/area/A = get_area(src)

	if	(client.music && !client.music.transition && (!A.ambient_music || (client.music_juke && client.music_juke.volume > 0)))
		client.music.Transition(src)
		client.music = null

	if(client.background && !client.background.transition && !(client.background.file in A.ambient_background))//[SSsunlight.current_step]))

		client.background.Transition(src)
		client.background = null

	if(client.psy && client.psy.volume > 10)
		return 1

	if(!client.music || (!client.music.transition && (world.time >= client.music.last_time + client.music.real_cooldown)))

		if(A.ambient_music && (!client.music_juke || (client.music_juke && client.music_juke.volume <= 0)))

			if(client.music)
				client.music.Transition(src)

			client.music = new/sound/ambient(file = safepick(A.ambient_music))
			////////////////////////
			client.music.real_cooldown = rand(A.ambient_music_cooldown * 0.8, A.ambient_music_cooldown * 1.4)
			client.music.last_time = world.time
			////////////////////////
			client.music.Set_Sound(AMBIENT_MUSIC_CHANNEL, 10, 0, -1)
			src << client.music

	if(!client.environment || (world.time >= client.environment.last_time + client.environment.real_cooldown))

		if(A.ambient_environment)

			if(A.ambient_environment_night && (SSsunlight.current_step == 243000 || SSsunlight.current_step == 810000))
				client.environment = new/sound/ambient(file = safepick(A.ambient_environment_night))
			else
				client.environment = new/sound/ambient(file = safepick(A.ambient_environment))

			if(client.environment)

				////////////////////////
				client.environment.last_time = world.time
				client.environment.real_cooldown = rand(A.ambient_environment_cooldown * 0.3, A.ambient_environment_cooldown * 1.5)
				////////////////////////
				client.environment.Set_Sound(AMBIENT_ENVIRONMENT_CHANNEL, rand(25, 60), rand(-100, 100), A.environment)
				src << client.environment

	if(!client.background || (!client.background.transition && (world.time >= client.background.last_time + client.background.real_cooldown)))

		if(A.ambient_background)

			if(A.ambient_background[SSsunlight.current_step])
				client.background = new/sound/ambient(file = A.ambient_background[SSsunlight.current_step])
				client.background.real_cooldown = A.ambient_background_cooldown[SSsunlight.current_step]

			if(client.background)
				////////////////////////
				client.background.last_time = world.time
				////////////////////////
				client.background.Set_Sound(AMBIENT_BACKGROUND_CHANNEL, 35, 0, A.environment)
				src << client.background

	return 1

/mob/living/carbon/human/handle_sounds()
	if(!..())
		return

	if(src.psyloss >= 25 && (!client.psy || (world.time >= client.psy.last_time + client.psy.real_cooldown)))
		client.psy = new/sound/ambient(file = 'stalker/sound/ambience/psy_amb.ogg')
		////////////////////////
		client.psy.last_time = world.time
		client.psy.real_cooldown = 110
		////////////////////////
		client.psy.Set_Sound(AMBIENT_PSY_CHANNEL, 60*(psyloss/200), 0, -1)
		src << client.psy


/sound/ambient/proc/Transition(var/mob/M, var/new_volume = 0)
	transition = 1
	status = SOUND_STREAM | SOUND_UPDATE
	//animate(src, volume = new_volume, time = 2.5, loop = 1)
	while(volume > 0)
		volume = max(volume - 2, 0)
		M << src
		/////////
		sleep(2.5)
		/////////
	//status = SOUND_PAUSED
	status = SOUND_STREAM
	transition = 0

/sound/proc/Set_Sound(var/channel_, var/volume_, var/pan_ , var/environment_)
	status = SOUND_STREAM
	repeat = 0
	wait = 0
	channel = channel_
	volume = volume_
	frequency = 0
	pan = pan_
	environment = environment_
	priority = 250