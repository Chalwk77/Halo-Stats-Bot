// Copyright (c) 2022, Jericho Crosby <jericho.crosby227@gmail.com>

package com.chalwk.commands;

import com.chalwk.listeners.CommandInterface;
import net.dv8tion.jda.api.EmbedBuilder;
import net.dv8tion.jda.api.events.interaction.command.SlashCommandInteractionEvent;
import net.dv8tion.jda.api.interactions.commands.OptionType;
import net.dv8tion.jda.api.interactions.commands.build.OptionData;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import static com.chalwk.Utilities.LoadStats.loadStats;

public class GetStats implements CommandInterface {

    @Override
    public String getName() {
        return "stats";
    }

    @Override
    public String getDescription() {
        return "Check the stats for a player";
    }

    @Override
    public List<OptionData> getOptions() {
        List<OptionData> data = new ArrayList<>();
        OptionData name = new OptionData(OptionType.STRING, "name", "Name of the player", true);
        data.add(name);
        return data;
    }

    @Override
    public void execute(SlashCommandInteractionEvent event) throws IOException {

        String name = event.getOption("name").getAsString();
        JSONObject stats = loadStats("./SAPP/Database/database.json");

        if (stats.has(name)) {

            JSONObject player = stats.getJSONObject(name);

            EmbedBuilder embed = new EmbedBuilder();
            embed.setTitle(name + "'s stats:");

            for (String stat : player.keySet()) {
                int value = player.getInt(stat);
                embed.addField("**" + stat + "**", "`" + value + "`", true);
            }

            event.replyEmbeds(embed.build()).queue();

        } else {
            event.reply("No stats found for " + name).queue();
        }
    }
}
