package com.james.lookify.services;
import java.util.List;
import java.util.Optional;
import org.springframework.stereotype.Service;
import com.james.lookify.models.*;
import com.james.lookify.repositories.SongRepository;




@Service
public class SongService {
    // adding the song repository as a dependency
	private final SongRepository songRepository;
    
    public SongService(SongRepository songRepository) {
        this.songRepository = songRepository;
    }
    // returns all the songs
    public List<Song> allSongs() {
        return songRepository.findAll();
    }
    // creates a song
    public Song createSong(Song b) {
        return songRepository.save(b);
    }
    // retrieves a song
    public Song findSong(Long id) {
        Optional<Song> optionalSong = songRepository.findById(id);
        if(optionalSong.isPresent()) {
            return optionalSong.get();
        } else {
            return null;
        }
    }
//    public Song findByArtistContaining(String artist) {
//        List<Song> listSong = songRepository.findByArtistContaining(artist);
//		if(listSong.isPresent()) {
//            return listSong.get();
//        } else {
//            return null;
//        }
//    }
	public void deleteSong(Long id) {
		songRepository.deleteById(id);
		
	}
	public Song updateSong(Long id, String title, String artist, Integer rating) {
		  Optional<Song> optionalSong = songRepository.findById(id);
	        if(optionalSong.isPresent()) {
	        	Song newSong = optionalSong.get();
	        	newSong.setTitle(title);
	        	newSong.setArtist(artist);
	        	newSong.setRating(rating);
	        	newSong = songRepository.save(newSong);
	            return newSong;
	        } else {
	            return null;
	        }
}
	public List<Song> searchedArtist(String artist) {
		return songRepository.findByArtistContaining(artist);
	}

}