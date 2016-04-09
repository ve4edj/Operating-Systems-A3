#include <inttypes.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "fat_fs.h"
#include "fat.h"

uint64_t getFirstSectorOfCluster(FS_Cluster cluster, FS_Instance * fsi);
FS_FATEntry getFATEntryForCluster(FS_Cluster cluster, FS_Instance * fsi);
FS_FATEntry getEOFMarker(FS_Instance * fsi);
uint8_t isFATEntryEOF(FS_FATEntry entry, FS_Instance * fsi);
uint8_t isFATEntryBad(FS_FATEntry entry, FS_Instance * fsi);
FS_EntryList * getDirListing(FS_Cluster dir, FS_Instance * fsi);
void freeFSEntryListItem(FS_EntryList * toFree);
FS_Cluster getNextFreeCluster(FS_Instance * fsi);
uint8_t getNumberOfLongEntriesForFilename(char * filename);
fs_result addDirListing(FS_Cluster dir, char * filename, fatEntry * entry, FS_Instance * fsi);
void zeroCluster(FS_Cluster cluster, FS_Instance * fsi);
uint8_t maskAndTest(uint8_t val, uint8_t mask);