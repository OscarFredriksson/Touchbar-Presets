#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include <IntelPowerGadget/EnergyLib.h>

struct Stats
{
	float temp;
	float freq;
	float power;
};

struct Stats getStats()
{
	StartLog("/tmp/PowerGadgetLog.csv");
	
	int numMsrs = 0;
	GetNumMsrs(&numMsrs);
	
	sleep(1);
	ReadSample();
	
	struct Stats stats;

	for (int j = 0; j < numMsrs; j++) {
		int funcID;
		char szName[1024];
		GetMsrFunc(j, &funcID);
		GetMsrName(j, szName);
		
		int nData;
		double data[3];
		GetPowerData(0, j, data, &nData);
		
		if(funcID == MSR_FUNC_TEMP) 		stats.temp = data[0];
		else if(funcID == MSR_FUNC_FREQ)	stats.freq = data[0]/1000;
		else if(funcID == MSR_FUNC_POWER) 	stats.power = data[0];

		
	}
	
	sleep(1);
	StopLog();

	return stats;
}

void printTemp(const float temp)
{
	printf("%2.0f°C", temp);
}

void printFreq(const float freq)
{
	printf("%.2fGHz", freq);
}

void printPower(const float power)
{
	printf("%3.2fW", power);
}

void printAll(struct Stats* stats)
{
	printTemp(stats->temp);
	printf(" | ");
	printFreq(stats->freq);
	printf(" | ");
	printPower(stats->power);
}

int main(int argc, char* argv[]) {

	IntelEnergyLibInitialize();

	struct Stats stats = getStats();

	const char* opts = "atfp";	//All, Temp, Freq, Power

	int flag_set = 0;

	int arg;
    while ((arg = getopt(argc, argv, opts)) != -1)
    {
		flag_set = 1;
        switch(arg)
        {
            case 'a':
			{
                printAll(&stats);
                break;
			}
			case 't':
                printTemp(stats.temp);
                break; 
            case 'f':
				printFreq(stats.freq);
				break;
			case 'p':
				printPower(stats.power);
				break;
			case '?':
				printf("invalid argument");
				return 0;
			default:
				return 0;
		}
	}	

	if(!flag_set)	printAll(&stats);

	printf("\n");

	return 0;
}