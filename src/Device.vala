// -*- Mode: vala; indent-tabs-mode: nil; tab-width: 4 -*-
/*-
 * Copyright (c) 2016-2017 elemntary LLC. (https://elementary.io)
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 *
 * Authored by: Corentin Noël <corentin@elementary.io>
 */

// This is a read-only class, set the properties via PulseAudioManager.
public class Sound.Device : GLib.Object {
    public signal void removed ();

    public bool input { get; set; default=true; }
    public uint32 index { get; construct; default=0U; }
    public string name { get; set; }
    public string display_name { get; set; }
    public string form_factor { get; set; }
    public bool is_default { get; set; default=false; }
    public bool is_muted { get; set; default=false; }
    public double volume { get; set; default=0; }
    public float balance { get; set; default=0; }
    public PulseAudio.ChannelPosition[] channel_positions { get; set; default={}; }
    public Device (uint32 index) {
        Object (index: index);
    }

    construct {
        
    }

    public string get_nice_form_factor () {
        switch (form_factor) {
            case "internal":
                return _("Built-in");
            case "speaker":
                return _("Speaker");
            case "handset":
                return _("Handset");
            case "tv":
                return _("TV");
            case "webcam":
                return _("Webcam");
            case "microphone":
                return _("Microphone");
            case "headset":
                return _("Headset");
            case "headphone":
                return _("Headphone");
            case "hands-free":
                return _("Hands-Free");
            case "car":
                return _("Car");
            case "hifi":
                return _("HiFi");
            case "computer":
                return _("Computer");
            case "portable":
                return _("Portable");
            default:
                return _("Output");
        }
    
    }
}
