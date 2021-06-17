#if !defined(USING_MAP_DATUM)

	#include "../shared/exodus_torch/_include.dm"

	#include "kaiserflotte_announcements.dm"
	#include "kaiserflotte_areas.dm"


	//CONTENT
	#include "job/jobs.dm"
	#include "datums/uniforms.dm"
	#include "items/cards_ids.dm"
	#include "kaiserflotte_gamemodes.dm"
	#include "kaiserflotte_presets.dm"
	#include "kaiserflotte_shuttles.dm"
	#include "kaiserflotte_elevator.dm"

	#include "kaiserflotte-1.dmm"
	#include "kaiserflotte-2.dmm"
	#include "kaiserflotte-3.dmm"
	#include "kaiserflotte-4.dmm"
	#include "kaiserflotte-5.dmm"
	#include "kaiserflotte-6.dmm"

	#include "../shared/exodus_torch/_include.dm"

	#include "../../code/modules/lobby_music/generic_songs.dm"

	#define USING_MAP_DATUM /datum/map/kaiserflotte

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Frontier
#endif
