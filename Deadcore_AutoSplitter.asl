state("Deadcore") {
	
	int chrono : "Deadcore.exe", 0x00A2E580, 0x1C, 0x8, 0x1C, 0x4, 0x50, 0x20;
	float initialTime : "Deadcore.exe", 0x00A2E580, 0x1C, 0x8, 0x1C, 0x4, 0x50, 0x20, 0x34;
	float startpausedtime : "Deadcore.exe", 0x00A2E580, 0x1C, 0x8, 0x1C, 0x4, 0x50, 0x20, 0x3C;
	byte paused : "Deadcore.exe", 0x00A2E580, 0x1C, 0x8, 0x1C, 0x4, 0x50, 0x20, 0x3A;
	
	
	
}





start {
	return((old.paused==1) && (current.paused==0));
		
	
}

split {
	return ((old.chrono != current.chrono) && timer.CurrentTime.GameTime == TimeSpan.FromSeconds(current.initialTime) );
}


isLoading {
	return (current.paused == 1);
}

gameTime{
	if(current.initialTime!=old.initialTime && current.paused == 1 && timer.CurrentTime.GameTime > TimeSpan.FromSeconds(current.initialTime)){
		return TimeSpan.FromSeconds(current.initialTime);
	}
}


//"DeadCore.exe"+00A2E580 +1C +8 +1C +4 +50 +20 +code_offset_below

//paused = +3A
//initialTime =+34
//finished = +39
//countPausedTime =+40
//lastplaytime = +44
//startpausedtime = 3C



