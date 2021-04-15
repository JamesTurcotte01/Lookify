package com.james.lookify.controllers;

import java.util.List;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.james.lookify.models.*;
import com.james.lookify.services.SongService;

@Controller
public class LookifyController {
    private final SongService songService;
    
    public LookifyController(SongService songService) {
        this.songService = songService;
    }
    @RequestMapping("/")
    public String home() {
        return "home.jsp";
    }
    @RequestMapping("/dashboard")
    public String index(Model model) {
        List<Song> songs = (List<Song>) songService.allSongs();
        model.addAttribute("songs", songs);
        model.addAttribute("song", new Song());
        return "dashboard.jsp";
    }
    @RequestMapping("/songs/{id}")
    public String show(@PathVariable("id") Long id, Model model) {
    	songService.findSong(id);
    	Song song = songService.findSong(id);
		model.addAttribute("song", song);
    	return "onesong.jsp";
    }
    @RequestMapping("/songs/new")
    public String newSong(@ModelAttribute("song") Song song) {
        return "create.jsp";
    }
    @RequestMapping(value="/songs", method=RequestMethod.POST)
    public String create(@Valid @ModelAttribute("song") Song song, BindingResult result) {
        if (result.hasErrors()) {
            return "create.jsp";
        } else {
            songService.createSong(song);
            return "redirect:/dashboard";
        }
    }
    @RequestMapping(value="/songs/{id}/delete", method=RequestMethod.POST)
    public String delete(@PathVariable("id") Long id) {
        songService.deleteSong(id);
        return "redirect:/dashboard";
    }
    @RequestMapping("/songs/{id}/edit")
    public String edit(@PathVariable("id") Long id, Model model) {
        Song song = songService.findSong(id);
        model.addAttribute("song", song);
        return "edit.jsp";
    }
    
    @RequestMapping(value="/songs/{id}", method=RequestMethod.PUT)
    public String update(@Valid @ModelAttribute("song") Song song, BindingResult result) {
        if (result.hasErrors()) {
            return "edit.jsp";
        } else {
            songService.createSong(song);
            return "redirect:/songs";
        }
    }
    @PostMapping("/songs/search")
    public String search(@RequestParam("artist") String artist, Model model) {
    	List<Song> artists = songService.searchedArtist(artist);
    	model.addAttribute("artist", artists);
    	return "search.jsp";
    }

}