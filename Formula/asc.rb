# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '6.5.3'
  license 'MIT'

  depends_on macos: :ventura

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/6.5.3/asc_6.5.3_macOS_arm64'
      sha256 '1c490d5df9b8263c043f43e6dfc10d7d5f3ec7821137e39a603b9348221f248d'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/6.5.3/asc_6.5.3_macOS_amd64'
      sha256 '128d379d962755bf76ab81017b4ffe0df0b346055d272d7233f51f09eec880b8'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_6.5.3_macOS_arm64' => 'asc'
    else
      bin.install 'asc_6.5.3_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
