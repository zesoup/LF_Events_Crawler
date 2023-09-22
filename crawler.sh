IFS=$'\n'
for x in $( seq 0 1000) ; do
	O=$(curl https://events.linuxfoundation.org/wp/wp-admin/admin-ajax.php -F "query=columns=auto&layout=mosaic&more=SHOW MORE&display=local&panel=&filter=&filter_type=include&fx=slide&timeout=5000&speed=1000&pause=1&strip-style=thumbs&controls=show&popup=hide&custom_classes=&alignment=&photo_layout=square&caption=none&thumb_size=s&main_size=b&tile_size=none&video_size=Site MP4&privacy_filter=&count=8&page=$x&paginate=&collections_display=expanded&user_id=13825348@N03&collection_id=&photoset_id=72177720310503336&gallery_id=&photo_id=&media=photos&type=flickr&style=default&view=photosets&title_position=none&headers=&iterate_level_3=1&per_page=8&photo_count=8&overlay_size=s&overlay_video_size=Site MP4" -F 'action=photonic_load_more' -F 'provider=flickr' -s | grep "stream-1" | grep -oP "href=(.*?jpg)" | cut -c 7-999 )
	for line in $O; do
	wget -nv $line &
	done
wait
done
