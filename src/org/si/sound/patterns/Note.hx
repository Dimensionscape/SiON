//----------------------------------------------------------------------------------------------------
// Note object used in PatternSequencer
//  Copyright (c) 2009 keim All rights reserved.
//  Distributed under BSD-style license (see org.si.license.txt).
//----------------------------------------------------------------------------------------------------


package org.si.sound.patterns;


/** Note object used in PatternSequencer. */
class Note
{
    // variables
    //--------------------------------------------------
    /** Note number[-1-127], -1 (or all negatives) sets playing with sequencers default note. */
    public var note : Int = 0;
    /** Velocity[-1-128], -1 (or all negatives) sets playing with sequencers default velocity, 0 sets no note (rest). */
    public var velocity : Int = 0;
    /** Length in 16th beat [16 for whole tone], Number.NaN sets playing with sequencers default length. */
    public var length : Float = 0;
    /** Voice index refering from PatternSequencer.voiceList, -1 (or all negatives) sets no voice changing.
     *  @see si.org.sound.PatternSequencer.voiceList 
     */
    public var voiceIndex : Int = 0;
    /** Gate time of this note, Number.NaN sets playing with swquencers default gateTime. */
    public var gateTime : Float = Math.NaN;
    /** Any informations */
    public var data : Dynamic = null;
    
    
    
    
    // constructor
    //--------------------------------------------------
    /** constructor
     *  @param note Note number[-1-127], -1 sets playing with sequencer's default note.
     *  @param velocity Velocity[-1-128], -1 sets playing with sequencer's default velocity, 0 sets no note (rest).
     *  @param length Length in 16th beat [16 for whole tone], Number.NaN sets playing with sequencers default length.
     *  @param voiceIndex Voice index refering from PatternSequencer.voiceList, -1 (or all negatives) sets no voice changing.
     *  @param gateTime Gate time of this note[0-1], Number.NaN sets playing with swquencers default gateTime.
     *  @param data Any informations you want.
     *  @see si.org.sound.PatternSequencer.voiceList.
     */
    public function new(note : Int = -1, velocity : Int = 0, length : Float = -1, voiceIndex : Int = -1, gateTime : Float = -1, data : Dynamic = null)
    {
        if (length == -1) length = Math.NaN;
        if (gateTime == -1) gateTime = Math.NaN;

        this.note = note;
        this.velocity = velocity;
        this.length = length;
        this.voiceIndex = voiceIndex;
        this.gateTime = gateTime;
        this.data = data;
    }
    
    
    
    
    // operations
    //--------------------------------------------------
    /** Set note.
     *  @param note Note number[-1-127], -1 sets playing with sequencer's default note.
     *  @param velocity Velocity[-1-128], -1 sets playing with sequencer's default velocity, 0 sets no note (rest).
     *  @param length Length in 16th beat [16 for whole tone], Number.NaN sets playing with sequencers default length.
     *  @param voiceIndex Voice index refering from PatternSequencer.voiceList, -1 (or all negatives) sets no voice changing. @see si.org.sound.PatternSequencer.voiceList.
     *  @param gateTime Gate time of this note[0-1], Number.NaN sets playing with swquencers default gateTime.
     *  @param data Any informations you want.
     *  @return this instance.
     */
    public function setNote(note : Int = -1, velocity : Int = -1, length : Float = -1, voiceIndex : Int = -1, gateTime : Float = -1, data : Dynamic = null) : Note
    {
        if (length == -1) length = Math.NaN;
        if (gateTime == -1) gateTime = Math.NaN;

        this.note = note;
        this.velocity = velocity;
        this.length = length;
        this.voiceIndex = voiceIndex;
        this.gateTime = gateTime;
        this.data = data;
        return this;
    }
    
    
    /** Set as rest. */
    public function setRest() : Note
    {
        velocity = 0;
        return this;
    }
    
    
    /** Copy from another note.
     *  @param src source note instnace.
     *  @return this instance
     */
    public function copyFrom(src : Note) : Note{
        var key : String;
        if (src == null)             return setRest();
        note = src.note;
        velocity = src.velocity;
        length = src.length;
        voiceIndex = src.voiceIndex;
        gateTime = src.gateTime;
        if (src.data) {
            data = { };
            data.copy(src.data);
        }
        else {
            data = null;
        }
        return this;
    }
    
    
    /** return new instance copied parameters from this note.
     *  @return new clone instance
     */
    public function clone() : Note{
        return new Note().copyFrom(this);
    }
}


