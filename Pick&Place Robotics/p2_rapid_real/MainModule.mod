MODULE MainModule
    PROC MoveBrick()
        MoveL Pos_prepick_Brick, v300, fine, tool0\WObj:=wobj0;
        MoveL Pos_pick_Brick, v20, fine, tool0\WObj:=wobj0;
        Reset GRIPPER_CLOSE;
        MoveL Pos_prepick_Brick, v20, fine, tool0\WObj:=wobj0;
        MoveJ Pos_origen, v100, z100, tool0\WObj:=wobj0;
        MoveL Pos_preplace_Brick, v100, fine, tool0\WObj:=wobj0;
        MoveL Pos_place_Brick, v20, fine, tool0\WObj:=wobj0;
        Set GRIPPER_CLOSE;
        MoveL Pos_preplace_Brick, v20, fine, tool0\WObj:=wobj0;
        MoveL Pos_origen, v300, fine, tool0\WObj:=wobj0;
    ENDPROC
    
    PROC MoveLata()
        MoveL Pos_prepick_Lata, v300, fine, tool0\WObj:=wobj0;
        MoveL Pos_pick_Lata, v20, fine, tool0\WObj:=wobj0;
        Reset GRIPPER_CLOSE;
        MoveL Pos_prepick_Lata, v20, fine, tool0\WObj:=wobj0;
        MoveJ Pos_origen, v100, z100, tool0\WObj:=wobj0;
        MoveL Pos_preplace_Lata, v100, fine, tool0\WObj:=wobj0;
        MoveL Pos_place_Lata, v20, fine, tool0\WObj:=wobj0;
        Set GRIPPER_CLOSE;
        MoveL Pos_preplace_Lata, v20, fine, tool0\WObj:=wobj0;
        MoveL Pos_origen, v300, fine, tool0\WObj:=wobj0;
    ENDPROC
    
    
    PROC main()
        set GRIPPER_CLOSE;
        MoveJ Pos_origen, v300, fine, tool0\WObj:=wobj0;

        Reset sal_Brick;
        Reset sal_Lata;
        WHILE TRUE DO
            Set CONVEYOR_FWD;
            IF sal_Brick = 1 THEN 
                TPWrite "brick detected";
                
                WaitDI CONVEYOR_OBJ_SEN, 1;
                Reset CONVEYOR_FWD;
                
                MoveBrick;
                Reset sal_Brick;
            ENDIF
            
            IF sal_Lata = 1 THEN 
                TPWrite "lata detected";
                
                WaitDI CONVEYOR_OBJ_SEN, 1;
                Reset CONVEYOR_FWD;
                                
                MoveLata;
                Reset sal_Lata;
            ENDIF

            
            WaitTime 1;
        ENDWHILE
    ENDPROC
ENDMODULE