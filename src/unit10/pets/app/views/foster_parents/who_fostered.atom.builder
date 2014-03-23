atom_feed do |feed|
	feed.title "Our beloved foster parents!"

  latest_foster = @foster_parents.sort_by(&:updated_at).last
  feed.updated( latest_foster && latest_foster.updated_at )

  @foster_parents.each do |parent|
    feed.entry(parent) do |entry|
      entry.title "Pet Adopted #{parent.pet_id}" 
      entry.summary type: 'xhtml' do |xhtml|
        xhtml.p "Pet Name: #{parent.pet.name}"
      end
      entry.author do |author| 
        author.name parent.name 
        author.email parent.email
        author.address parent.address
      end 
    end
  end
end