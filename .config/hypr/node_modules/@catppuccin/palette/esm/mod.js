import definitions from "./palette.js";
const entriesFromObject = (obj) => Object.entries(obj);
/**
 * All flavors of Catppuccin
 */
export const flavors = entriesFromObject(definitions)
    .reduce((acc, [flavorName, flavor]) => {
    acc[flavorName] = {
        ...flavor,
        colorEntries: entriesFromObject(flavor.colors),
    };
    return acc;
}, {});
/**
 * A typed `Object.entries()` iterable of all Catppuccin flavors
 */
export const flavorEntries = entriesFromObject(flavors);
