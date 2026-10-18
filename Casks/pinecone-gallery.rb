cask "pinecone-gallery" do
  version "1.0.0"
  sha256 "8b34833783fb83608655d5db1b13bc195be45532a73cd0408f6d2f7b9632bf48"

  url "https://github.com/hemkum/pinecone-gallery/releases/download/v#{version}/PineconeGallery-#{version}.zip"
  name "Pinecone Gallery"
  desc "Fast, minimal photo viewer that opens any folder without importing"
  homepage "https://github.com/hemkum/pinecone-gallery"

  depends_on macos: ">= :ventura"

  app "Pinecone Gallery.app"

  # The app is open source but not notarized; clear the quarantine flag so
  # the first launch isn't blocked by Gatekeeper.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Pinecone Gallery.app"]
  end

  zap trash: [
    "~/Library/Preferences/io.github.hemkum.pinecone-gallery.plist",
    "~/Library/Saved Application State/io.github.hemkum.pinecone-gallery.savedState",
  ]
end
