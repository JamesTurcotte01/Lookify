package com.james.lookify.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.james.lookify.models.Song;

import java.util.List;
import java.util.Optional;


@Repository
public interface SongRepository extends CrudRepository<Song, Long>{
    // this method retrieves all the languages from the database
    List<Song> findAll();
    // this method finds languages with descriptions containing the search string
    List<Song> findByArtistContaining(String search);
    // this method counts how many titles contain a certain string
    Long countByTitleContaining(String search);
    // this method deletes a language that starts with a specific title
    Long deleteByTitleStartingWith(String search);
    void deleteById(Long id);
	Song save(Optional<Song> b);
    
}

