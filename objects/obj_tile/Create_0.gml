controller = "none"
hovering = false
selected = false

// Initialize the number of ships on this tile
ships_on_tile = 0;
previous_tile = noone; // No tile at the start

// Define the array of solar system names
global.solar_system_names = [
    "Aurora", "Nebula", "Eclipse", "Zenith", "Nova", "Celestia", "Pinnacle", 
    "Stellar", "Orion", "Vortex", "Lumen", "Quasar", "Astral", "Nexus", 
    "Horizon", "Eternity", "Radiance", "Galaxia", "Drift", "Solstice", 
    "Polaris", "Echo", "Zenon", "Nebulon", "Cosmos", "Seren", "Vega", 
    "Aurion", "Lynx", "Triton", "Vesper", "Aurorae", "Zephyr", "Meteor", 
    "Helios", "Nebulith", "Krypton", "Aether", "Obsidian", "Phaeton", 
    "Elysium", "Altius", "Chronos", "Hades", "Tycho", "Eros", "Sirius", 
    "Celestus", "Zenara", "Tethys", "Lyra", "Arcadia", "Eon", "Cetus"
];

// Create a copy of the array to keep track of available names
global.available_names = array_copy_(global.solar_system_names);

// Example usage in the Create event
name = get_unique_name();

has_base = false;