package com.mycompany.cmd;

import com.codename1.ui.Command; 
import com.codename1.ui.events.ActionEvent;
import com.mycompany.a3.GameWorld;

public class WarpCommand extends Command 
{
	private GameWorld gw;
	
	/**
	 * Creates a button command to reset player position to origin
	 * @param gw - Reference to game world to invoke appropriate method
	 */
	public WarpCommand(GameWorld gw)
	{
		super("Hyperspace jump");
		this.gw = gw;
	}
	
	@Override
	public void actionPerformed(ActionEvent e)
	{
		gw.resetPos();
		System.out.println("Hyperspace jump");
	}
}
