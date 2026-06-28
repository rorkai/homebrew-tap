# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '2.4.1'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/2.4.1/asc_2.4.1_macOS_arm64'
      sha256 '7f27d00f22fe063871c7cd56ae4b1fea58b93a282af3ecf2a2acb74d182d8504'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/2.4.1/asc_2.4.1_macOS_amd64'
      sha256 '30fbbaaea2ddba28bf8bbcd56f961c47fef073a9af76a6d2611a6840766096a5'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_2.4.1_macOS_arm64' => 'asc'
    else
      bin.install 'asc_2.4.1_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
