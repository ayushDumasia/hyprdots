"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.flavorEntries = exports.flavors = void 0;
const palette_js_1 = __importDefault(require("./palette.js"));
const entriesFromObject = (obj) => Object.entries(obj);
/**
 * All flavors of Catppuccin
 */
exports.flavors = entriesFromObject(palette_js_1.default)
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
exports.flavorEntries = entriesFromObject(exports.flavors);
